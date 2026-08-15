#include "compression.h"

static inline uint8x8_t __attribute__((always_inline)) vector_compress_samples(int16x8_t s) {
    // Neon q registers are 128 bits so 128/16 = 8 samples can be processed at a time (uint16x8_t)
    // Theoretically 128/8 = 16 samples could be returned from this function
    // but since we are limited by input, return 8 * 8 = 64 bits (uint8x8_t)
    // q instructions: use 128bit registers

    // Replaces manual magnitude calculation: uint16_t magnitude = ((s + mask) ^ mask);
    uint16x8_t magnitudes = vreinterpretq_u16_s16(vabsq_s16(s));

    // Get sign bits as 8x8 directly instead of shifting to lower 8 later
    // vshrn_n shifts by n and narrows by half in one op (u16 -> u8)
    uint8x8_t sign_bits = vand_u8(
        vshrn_n_u16(vreinterpretq_u16_s16(s), 8), vdup_n_u8(0x80)
    );

    uint16x8_t const mag_bias_vec = vdupq_n_u16(MAGNITUDE_BIAS); // Put bias in each element position
    magnitudes = vaddq_u16(magnitudes, mag_bias_vec);            // Bias samples so leading 1s match chord boundaries

    magnitudes = vminq_u16(magnitudes, vdupq_n_u16(0x7FFF));     // Clamp samples to 0x7FFF

    // Equiv. to uint8_t clz = __clz16_inline(magnitude) - 1;
    uint16x8_t clz_u16 = vclzq_u16(magnitudes); // Non-vectorized version subtracts one here, which is compiler optimized out when we use
                                                // (7 - clz) and (10 - clz) later. Vector expression can't be optimized the same way
                                                // so here we remove the subtraction and instead do (8 - clz) and (11 - clz) later
    
    uint8x8_t clz_u8 = vmovn_u16(clz_u16); // Need for calculating chord, leaving clz_u16 separate saves op when calculating shift counts

    // Now using 64 bit instructions/registers for 8x8
    uint8x8_t chord_indecies = vsub_u8(vdup_n_u8(8), clz_u8);
    uint8x8_t code_word_bases = vshl_n_u8(chord_indecies, 4); // Shift chord bits of each element into position = 0b0XXX0000

    // Cannot shift elements by variable amounts in one instruction. Need
    // per-lane shift count = clz - 10  (negative -> right shift by 10 - clz)
    // Needs to be negative as vshr (vec shift right) can only shift by const
    // but we can left shift with a variable amount, which can be negative -> right shift
    int16x8_t shift_counts = vsubq_s16(
        vreinterpretq_s16_u16(clz_u16),
        vdupq_n_s16(11)
    );

    // Vectorized version of:
    // uint8_t code_word = (code_word_base | (sign_bit >> 8)) |
    //                     ((magnitude >> (10 - clz)) & 0x0F);
    uint8x8_t code_words = vorr_u8(
        vorr_u8(code_word_bases, sign_bits),                // Sign bits already in top position of each 8bit element
        vand_u8(
            vmovn_u16(vshlq_u16(magnitudes, shift_counts)), // magnitude >> (10 - clz), narrowed (take low half)
            vdup_n_u8(0x0F)                                 // Only keep the lower 4 bits of each element (ABCD) to complete codeword
        )
    );

    return vmvn_u8(code_words); // Bitwise NOT code words to match mu-law spec
}

static inline int16x8_t __attribute__((always_inline)) vector_decompress_samples(uint8x8_t s) {
    // Neon q registers are 128 bits so 128/8 = 16 compressed samples can be 
    // processed at a time (uint16x8_t). However, we can only return 
    // 128/16 = 8 decompressed samples in a single register, so limit input to 8 samples

    // s = vmvn_u8(s); 
    // Normally we would do this inversion here, but this appears to slow down the code,
    // presumably by either blocking pipelining or preventing the compiler from optimizing.
    // Instead, fold the inversion into each usage of s 

    // If we had inverted s upfront, the calculation for shift_counts would be done this way.
    // To allow us to pipeline better, the chord index can be calculated 
    // within the shift_counts expr by using vsra and vbic
    /*    
        // Naive implementation: uint8_t chord_index = (s ^ sign_bit) >> 4;
        // e.g. remove the sign bit and move the chord bits to 0:2
        // Logically equivalent to shifting first, then masking only bits 0:2 which
        // means sign_bits no longer needed

        int8x8_t chord_indecies = vreinterpret_s8_u8(
            vand_u8(
                vshr_n_u8(s, 4),
                vdup_n_u8(0x07)
            ));

        int16x8_t shift_counts = vmovl_s8(        // Widen to s16
            vadd_s8(chord_indecies, vdup_n_s8(3)) // shift_count = chord_index + 3
        );
    */

    int16x8_t shift_counts = vmovl_s8( vreinterpret_s8_u8( // Cast to s8 and widen to s16
        vsra_n_u8(                                         // This is complicated. vsra = shift-right-accumulate allows us to fuse (>> 4) and (+ 3)
            vdup_n_u8(3),                                  
            vbic_u8(                                       // s is not yet inverted. vbic (AND-NOT) combines inversion with mask to allow us to get the chord index here
                vdup_n_u8(0x70), 
                s
            ), 
            4
        )                       
    ));

    uint16x8_t magnitudes = vshlq_u16(
        vmovl_u8(                             // Widen to u16 so the shift doesn't overflow
            vorr_u8(                          // Equiv. to uint16_t magnitude = (((s & 0x0F) | 0x10) << (shift_count)); except s is not yet inverted
                vbic_u8(vdup_n_u8(0x0F), s),  // (~s) & 0x0F via bic (AND-NOT) allows the inversion to be combined with the 'and' here
                vdup_n_u8(0x10)
            )
        ),
        shift_counts
    );

    magnitudes = vsubq_u16(magnitudes, vdupq_n_u16(MAGNITUDE_BIAS)); // Undo magnitude bias add

    // Mildly cursed expression to shift sign bit to top bit of u16, then convert to s16 and shift right to extend the sign across all bits
    // Naive implementation: int16_t const mask = (int16_t)(((uint16_t)s) << 8) >> 15;
    // Vectorized: vmovl_s8 widens s8 to s16 with sign extension (extend bit 7 into new top 8 bits), so if we cast the u8 -> s8
    // before vmovl'ing it to s16, the first shift is not actually needed and second shift can be changed to 7 instead of 15
    // e.g. 0b1xxx xxxx u8 -> 0b1xxx xxxx s8 -> 0b1111 1111 1xxx xxxx s16 -> 0b1111 1111 1111 1111 s16
    int16x8_t const mask = vshrq_n_s16( vmovl_s8(vreinterpret_s8_u8(vmvn_u8(s))), 7 ); 
    // s has not been inverted yet so do that here. Explaination: because we have eliminated the upfront-blocking ~s operation, 
    // operations that use s before this can be pipelined (because we can replace instructions that were using ~s with instructions that 
    // both invert s and do an operation on it at the same time). If we were to invert s upfront, we could use it here 
    // directly but the function overall will be slower because we wait on ~s to do two things instead of one

    // To convert to 2's complement: if negative, invert and add 1, if positive do nothing
    // Naive implementation: int16_t out = (magnitude ^ mask) + (sign_bit >> 7); 
    // Logically equivalent to (x ^ mask) - mask, which removes need to calculate sign bits
    int16x8_t out = vsubq_s16(
        veorq_s16( vreinterpretq_s16_u16(magnitudes), mask ),
        mask
    );

    return out;
}

static inline uint8_t __attribute__((always_inline)) compress_sample(int16_t s) {
    int16_t const mask = s >> 15;                            // Getting the sign bit. It must be signed to allow sign extension when shifting so that the mask is all 1's instead of 000...01
    uint16_t magnitude = ((s + mask) ^ mask);                // If s negative, mask is all 1s (-1 in 2's complement). Subtracting 1 then inverting if negative (using mask) gives magnitude
    uint16_t sign_bit  = s & 0x8000;

    magnitude += MAGNITUDE_BIAS;                             // Bias samples so leading 1s match chord boundaries

    uint16_t sat = -(magnitude >> 15);                       // All 1s (-1) if bias pushed magnitude into bit 15 (e.g. INT16_MIN), else 0
    magnitude = (magnitude & ~sat) | (0x7FFF & sat);         // Branchless clamp to 0x7FFF so it maps to the top codeword instead of underflowing clz

    uint8_t clz = __clz16_inline(magnitude) - 1;             // -1 to remove zero in place of sign bit

    uint8_t chord_index = 7 - clz;
    uint8_t code_word_base = chord_index << 4;               // Shift chord bits into position = 0b0XXX0000

    uint8_t code_word = (code_word_base | (sign_bit >> 8)) | // Restore sign bit in position 7. Must shift from bit 15 to 7 for uint8 output
                        ((magnitude >> (10 - clz)) & 0x0F);  // Shift ABCD to bits 0:3 and mask to complete codeword 

    return ~code_word;                                       // Invert sample to match mu-law spec
}

static inline int16_t __attribute__((always_inline)) decompress_sample(uint8_t s) {
    s = ~s;                                                          // Uninvert sample to match mu-law spec
    
    uint8_t chord_index = (s >> 4) & 0x07;                           // Shift chord bits into position 0:2 and mask only these bits

    uint16_t magnitude = (((s & 0x0F) | 0x10) << (chord_index + 3)); // Keep only the lower 4 bits (ABCD) and add leading 1 to form 5-bit value (1ABCD).
                                                                     // Shift left by chord_index + 3 to restore magnitude to original position

    magnitude -= MAGNITUDE_BIAS;                                     // remove the magnitude bias to restore original magnitude
    
    int16_t const mask = (int16_t)(((uint16_t)s) << 8) >> 15;        // ough. Shift up as unsigned int, then cast to signed so we get sign 
                                                                     // extension and shift back down to get 0xFF if negative or 0x00 if positive

    int16_t out = (magnitude ^ mask) - mask;                         // Convert back to twos-complement 
                                                                     // L.E. to int16_t out = (magnitude ^ mask) + (sign_bit >> 7); but removes need for sign_bit calculation
                                                            
    return out;
}

void* compress_wav_thread(void* arg) {
    thread_args_t args = *((thread_args_t*)arg);
    
    int16_t *in_samples  = args.u16_buffer_p;
    uint8_t *out_samples = args.u8_buffer_p;
    uint32_t num_samples = args.num_samples;

    uint32_t i = 0;
    for (; i + 16 <= num_samples; i += 16) {                  // 8 samples per NEON register
        uint8x8_t c0 = vector_compress_samples(vld1q_s16(&in_samples[i]));
        uint8x8_t c1 = vector_compress_samples(vld1q_s16(&in_samples[i + 8]));
        vst1q_u8(&out_samples[i], vcombine_u8(c0, c1));
    }

    return NULL;
}

void* decompress_wav_thread(void* arg) {
    thread_args_t args = *((thread_args_t*)arg);
    
    uint8_t *in_samples  = args.u8_buffer_p;
    int16_t *out_samples = args.u16_buffer_p;
    uint32_t num_samples = args.num_samples;

    uint32_t i = 0;
    for (; i + 8 <= num_samples; i += 8) {                  // 8 samples per NEON register
        uint8x8_t samples = vld1_u8(&in_samples[i]);
        int16x8_t decompressed = vector_decompress_samples(samples);
        vst1q_s16(&out_samples[i], decompressed);
    }

    return NULL;
}

wav_t* compress_wav(wav_t* in) {
    uint16_t blockAlign = in->fmt.nBlockAlign;
    uint32_t num_frames = in->data.cksize / blockAlign;

    wav_t* out = new_wav(in->fmt.nChannels, in->fmt.nSamplesPerSec, 8, num_frames, WAVE_FORMAT_MULAW);
    if (out == NULL) {
        exit(1);
    }

    int16_t *in_samples  = (int16_t *)in->data.samples;
    uint8_t *out_samples = out->data.samples;
    uint32_t num_samples = in->data.cksize / sizeof(int16_t);

    // Give each thread a whole number of 16-sample batches 
    uint32_t num_batches   = num_samples / 16;
    uint32_t base_batches  = num_batches / NUM_THREADS;
    uint32_t extra_batches = num_batches % NUM_THREADS;
    uint32_t offset = 0;

    pthread_t threads[NUM_THREADS];
    thread_args_t thread_args[NUM_THREADS];
    cpu_set_t cpu;
    pthread_attr_t attr;

    // Dispatch worker threads and bind them to a specific physical core
    for (uint8_t i = 0; i < NUM_THREADS; ++i) {
        uint32_t count = (base_batches + (i < extra_batches ? 1 : 0)) * 16;
        thread_args[i].u8_buffer_p  = out_samples + offset;
        thread_args[i].u16_buffer_p = in_samples  + offset;
        thread_args[i].num_samples  = count;
        offset += count;

        // Bind thread i to core i
        pthread_attr_init(&attr);
        CPU_ZERO(&cpu);
        CPU_SET(i, &cpu);
        pthread_attr_setaffinity_np(&attr, sizeof(cpu), &cpu);

        pthread_create(&threads[i], &attr, &compress_wav_thread, (void*)&thread_args[i]);
        pthread_attr_destroy(&attr);
    }
    
    for (uint8_t i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }

    for (uint32_t i = offset; i < num_samples; ++i) { // Final < 8 samples that don't fill a batch
        out_samples[i] = compress_sample(in_samples[i]);
    }

    return out;
}

wav_t* decompress_wav(wav_t* in) {
    uint16_t blockAlign = in->fmt.nBlockAlign;
    uint32_t num_frames = in->data.cksize / blockAlign;

    wav_t* out = new_wav(in->fmt.nChannels, in->fmt.nSamplesPerSec, 16, num_frames, WAVE_FORMAT_PCM);
    if (out == NULL) {
        exit(1);
    } 

    uint8_t *in_samples  = in->data.samples;
    int16_t *out_samples = (int16_t *)out->data.samples;
    uint32_t num_samples = in->data.cksize;

    // Give each thread a whole number of 8-sample NEON batches (64 bits of u8)
    uint32_t num_batches   = num_samples / 8;
    uint32_t base_batches  = num_batches / NUM_THREADS;
    uint32_t extra_batches = num_batches % NUM_THREADS;
    uint32_t offset = 0;

    pthread_t threads[NUM_THREADS];
    thread_args_t thread_args[NUM_THREADS];
    cpu_set_t cpu;
    pthread_attr_t attr;

    // Dispatch worker threads and bind them to a specific physical core
    for (uint8_t i = 0; i < NUM_THREADS; ++i) {
        uint32_t count = (base_batches + (i < extra_batches ? 1 : 0)) * 8;
        thread_args[i].u8_buffer_p  = in_samples  + offset;
        thread_args[i].u16_buffer_p = out_samples + offset;
        thread_args[i].num_samples  = count;
        offset += count;

        // Bind thread i to core i
        pthread_attr_init(&attr);
        CPU_ZERO(&cpu);
        CPU_SET(i, &cpu);
        pthread_attr_setaffinity_np(&attr, sizeof(cpu), &cpu);

        pthread_create(&threads[i], &attr, &decompress_wav_thread, (void*)&thread_args[i]);
        pthread_attr_destroy(&attr);
    }
    
    for (uint8_t i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }

    for (uint32_t i = offset; i < num_samples; ++i) { // Final < 8 samples that don't fill a batch
        out_samples[i] = decompress_sample(in_samples[i]);
    }

    return out;
}
