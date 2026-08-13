#include "compression.h"

#define MAGNITUDE_BIAS 132

uint8x8_t vector_compress_samples(int16x8_t s) {
    // Neon registers are 128 bits so 128/16 = 8 samples can be processed at a time (uint16x8_t)
    // Theoretically 128/8 = 16 samples could be returned from this function
    // but since we are limited by input, return 8 * 8 = 64 bits (uint8x8_t)

    // q instructions: use 128bit registers
    int16x8_t const masks = vshrq_n_s16(s, 15); // Shift all individual elements by 15. Bits do not spill into lower elements
                                                // so this is equivalent to shifting each one individually with sign extension
                                                // Elements become 0xFFFF if the sample was negative and 0x0000 if positive

    // Vectorized version of uint16_t magnitude = ((s + mask) ^ mask);                                                
    uint16x8_t magnitudes = veorq_u16(              // veorq_u16 = XOR. 
        vreinterpretq_u16_s16(vaddq_s16(s, masks)), // Cast vec int16 -> vec uint16
        vreinterpretq_u16_s16(masks)                // Sign-extended masks can now also be cast
    ); 

    uint16x8_t sign_bits = vandq_u16(vreinterpretq_u16_s16(s), vdupq_n_u16(0x8000));
    
    uint16x8_t const mag_bias_vec = vdupq_n_u16(MAGNITUDE_BIAS); // Put bias in each element position
    magnitudes = vaddq_u16(magnitudes, mag_bias_vec);            // Bias samples so leading 1s match chord boundaries

    magnitudes = vminq_u16(magnitudes, vdupq_n_u16(0x7FFF));     // Clamp samples to 0x7FFF

    // Equiv. to uint8_t clz = __clz16_inline(magnitude) - 1;
    uint8x8_t clz = vmovn_u16(                           // Narrow each element to 8 bytes
        vsubq_u16(vclzq_u16(magnitudes), vdupq_n_u16(1)) // -1 to remove zero in place of sign bit
    );
    
    // Now using 64 bit instructions/registers for 8x8
    uint8x8_t chord_indecies = vsub_u8(vdup_n_u8(7), clz);
    uint8x8_t code_word_bases = vshl_n_u8(chord_indecies, 4); // Shift chord bits of each element into position = 0b0XXX0000

    // Cannot shift elements by variable amounts in one instruction. Need
    // per-lane shift count = clz - 10  (negative -> right shift by 10 - clz)
    // Needs to be negative as vshr (vec shift right) can only shift by const
    int16x8_t shift_counts = vsubq_s16(
        vreinterpretq_s16_u16(vmovl_u8(clz)),
        vdupq_n_s16(10)
    );

    // Vectorized version of:
    // uint8_t code_word = (code_word_base | (sign_bit >> 8)) |
    //                     ((magnitude >> (10 - clz)) & 0x0F);
    uint8x8_t code_words = vorr_u8(
        vorr_u8(
            code_word_bases, 
            vmovn_u16(vshrq_n_u16(sign_bits, 8)) // Restore sign bit in position 7 of each element, then take only the low halves of u16
        ),
        vand_u8(
            vmovn_u16(vshlq_u16(magnitudes, shift_counts)), // magnitude >> (10 - clz), narrowed
            vdup_n_u8(0x0F)
        )
    );

    return vmvn_u8(code_words); // Bitwise NOT code words to match mu-law spec
}

int16x8_t vector_decompress_samples(uint8x8_t s) {
    // Neon registers are 128 bits so 128/8 = 16 compressed samples can be 
    // processed at a time (uint16x8_t). However, we can only return 
    // 128/16 = 8 decompressed samples in a single register, so limit input to 8 samples

}

uint8_t compress_sample(int16_t s) {
    int16_t const mask = s >> 15;                            // Getting the sign bit. It must be signed to allow sign extension when shifting so that the mask is all 1's instead of 000...01
    uint16_t magnitude = ((s + mask) ^ mask);                // If s negative, mask is all 1s (-1 in 2's compliment). Subtracting 1 then inverting if negative (using mask) gives magnitude
    uint16_t sign_bit  = s & 0x8000;

    magnitude += MAGNITUDE_BIAS;                             // Bias samples so leading 1s match chord boundaries

    uint16_t sat = -(magnitude >> 15);                       // All 1s (-1) if bias pushed magnitude into bit 15 (e.g. INT16_MIN), else 0
    magnitude = (magnitude & ~sat) | (0x7FFF & sat);         // Branchless clamp to 0x7FFF so it maps to the top codeword instead of underflowing clz

    uint8_t clz = __clz16_inline(magnitude) - 1;             // -1 to remove zero in place of sign bit

    uint8_t chord_index = 7 - clz;
    uint8_t code_word_base = chord_index << 4;               // Shift chord bits into position = 0b0XXX0000

    uint8_t code_word = (code_word_base | (sign_bit >> 8)) | // Restore sign bit in position 7. Must shift from bit 15 to 7 for uint8 output
                        ((magnitude >> (10 - clz)) & 0x0F);  // Shift ABCD to bits 0:3 and mask to complete codeword 

    // Debug output
    // printf("sign: %s / sample: %s / %5d\tmag (biased): %s / clz: %3d", 
    //     u16_to_binary(sign_bit),
    //     u16_to_binary(s), 
    //     (int16_t)s, 
    //     u16_to_binary(magnitude), 
    //     clz
    // );

    // printf("\t codeword: %s / out: %s\n\n",
    //     byte_to_binary(code_word_base),
    //     byte_to_binary(code_word)
    // );

    return ~code_word; // Invert sample to match mu-law spec
}

int16_t decompress_sample(uint8_t s) {
    s = ~s;
    uint8_t sign_bit = s & 0x80;
    
    uint8_t chord_index = (s ^ sign_bit) >> 4;  // Remove sign bit and shift chord bits into position 0:2

    uint16_t magnitude = (((s & 0x0F) | 0x10) << (chord_index + 3));

    magnitude -= MAGNITUDE_BIAS;
    
    int16_t const mask = (int16_t)(((uint16_t)s) << 8) >> 15; // ough
    int16_t out = (magnitude ^ mask) + (sign_bit >> 7);

    return out;
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

    uint32_t i = 0;
    for (; i + 8 <= num_samples; i += 8) {                  // 8 samples per NEON register
        int16x8_t samples = vld1q_s16(&in_samples[i]);
        uint8x8_t compressed = vector_compress_samples(samples);
        vst1_u8(&out_samples[i], compressed);
    }

    for (; i < num_samples; ++i) {                          // Remaining (< 8) samples
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

    uint16_t newBlockAlign = out->fmt.nBlockAlign;

    for (uint32_t i = 0; i < num_frames; ++i) {
        uint8_t *frame = &in->data.samples[i * blockAlign];

        int16_t l_sample = *frame;
        int16_t r_sample = *(frame+1);
        
        int16_t l_processed = decompress_sample(l_sample);
        int16_t r_processed = decompress_sample(r_sample);

        uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

        uint8_t l_sample_low  = (uint8_t)(l_processed);
        uint8_t l_sample_high = (uint8_t)(l_processed >> 8);

        uint8_t r_sample_low  = (uint8_t)(r_processed);
        uint8_t r_sample_high = (uint8_t)(r_processed >> 8);

        // // print l_processed and l_sample_low and l_sample_high in binary to sanity check
        // printf("l_processed: %s / l_sample_low: %s / l_sample_high: %s\n", u16_to_binary(l_processed), byte_to_binary(l_sample_low), byte_to_binary(l_sample_high));
        // printf("r_processed: %s / r_sample_low: %s / r_sample_high: %s\n", u16_to_binary(r_processed), byte_to_binary(r_sample_low), byte_to_binary(r_sample_high));

        *out_frame       = l_sample_low;
        *(out_frame + 1) = l_sample_high;
        *(out_frame + 2) = r_sample_low;
        *(out_frame + 3) = r_sample_high;
    }

    return out;    
}
