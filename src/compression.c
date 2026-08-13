#include "compression.h"

#define MAGNITUDE_BIAS 132

uint8_t compress_sample(int16_t s) {
    int16_t const mask = s >> 15;                            // Getting the sign bit. It must be signed to allow sign extension when shifting so that the mask is all 1's instead of 000...01
    uint16_t sign_bit  = s & 0x8000;                         // Moved up to reduce dependencies 

    uint16_t magnitude = ((s + mask) ^ mask);                // If s negative, mask is all 1s (-1 in 2's compliment). Subtracting 1 then inverting if negative (using mask) gives magnitude

    magnitude += MAGNITUDE_BIAS;                             // Bias samples so leading 1s match chord boundaries

    uint16_t sat = -(magnitude >> 15);                       // All 1s (-1) if bias pushed magnitude into bit 15 (e.g. INT16_MIN), else 0
    magnitude = (magnitude & ~sat) | (0x7FFF & sat);         // Branchless clamp to 0x7FFF so it maps to the top codeword instead of underflowing clz

    // asm volatile (
    //     "usat\t%0, #15, %1\n"
    //     : "=r" (magnitude)
    //     : "r" (magnitude), "r" (MAGNITUDE_BIAS)
    // );

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

    return ~code_word;
}

int16_t decompress_sample(uint8_t s) {
    s = ~s;
    uint8_t sign_bit = s & 0x80;
    
    /*move up to add a gap between mask being assigned and being used to reduce dependencies and allow for parallelism*/
    int16_t const mask = (int16_t)(((uint16_t)s) << 8) >> 15; // ough. Shift up as unsigned int, then cast to signed so we get sign 
                                                              // extension and shift back down to get 0xFF if negative or 0x00 if positive
    
    // Unfortunately, these are all true dependencies, and because the samples are handled one at a time, we can't really do much 
    uint8_t chord_index = (s ^ sign_bit) >> 4;  // Remove sign bit and shift chord bits into position 0:2

    uint16_t magnitude = (((s & 0x0F) | 0x10) << (chord_index + 3));

    magnitude -= MAGNITUDE_BIAS;
    
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

    uint16_t newBlockAlign = out->fmt.nBlockAlign;

    //~~~~~~~ Loop prologue ~~~~~~~

    uint8_t *frame = &in->data.samples[0];
    // Samples are 2's compliment little-endian
    int16_t l_sample = *(frame+1) << 8 | *frame;
    int16_t r_sample = *(frame+3) << 8 | *(frame+2);

    uint32_t i = 0;
    for (; i < num_frames-1; ++i) {

        //Moved up to reduce dependencies and allow for parallelism
        uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

        
        uint8_t l_processed = compress_sample(l_sample);
        uint8_t r_processed = compress_sample(r_sample);


        *out_frame       = l_processed; // Endianness no longer matters because samples are now only 1 byte
        *(out_frame + 1) = r_processed;
        //~~~~~~~~~~~~

        // Get the next frame's samples (same as before, but all shifted up one frame) 
        // Samples are 2's compliment little-endian
        l_sample = *((frame+2)+1) << 8 | *(frame+2);
        r_sample = *((frame+2)+3) << 8 | *((frame+2)+2);
        //Set the frame pointer to the next frame
        frame = &in->data.samples[(i+1)* blockAlign];

    }
    uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

        
    uint8_t l_processed = compress_sample(l_sample);
    uint8_t r_processed = compress_sample(r_sample);


    *out_frame       = l_processed; // Endianness no longer matters because samples are now only 1 byte
    *(out_frame + 1) = r_processed;

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

    // ~~~~~~~~~~ Prologue ~~~~~~~~~~
    uint8_t *frame = &in->data.samples[0];

    int16_t l_sample = *frame;
    int16_t r_sample = *(frame+1);
    uint32_t i = 0;
    for (; i < num_frames-1; ++i) {
        
        int16_t l_processed = decompress_sample(l_sample);
        int16_t r_processed = decompress_sample(r_sample);

        uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

        uint8_t l_sample_low  = (uint8_t)(l_processed);
        uint8_t r_sample_low  = (uint8_t)(r_processed);

        uint8_t l_sample_high = (uint8_t)(l_processed >> 8);
        uint8_t r_sample_high = (uint8_t)(r_processed >> 8);

        // // print l_processed and l_sample_low and l_sample_high in binary to sanity check
        // printf("l_processed: %s / l_sample_low: %s / l_sample_high: %s\n", u16_to_binary(l_processed), byte_to_binary(l_sample_low), byte_to_binary(l_sample_high));
        // printf("r_processed: %s / r_sample_low: %s / r_sample_high: %s\n", u16_to_binary(r_processed), byte_to_binary(r_sample_low), byte_to_binary(r_sample_high));

        
        frame = &in->data.samples[(i+1)* blockAlign];

        *out_frame       = l_sample_low;
        *(out_frame + 1) = l_sample_high;
        *(out_frame + 2) = r_sample_low;
        *(out_frame + 3) = r_sample_high;

        // get next iteration's samples (frame was incremented above)
        l_sample = *frame;
        r_sample = *(frame+1);

    }
    int16_t l_processed = decompress_sample(l_sample);
    int16_t r_processed = decompress_sample(r_sample);

    uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

    uint8_t l_sample_low  = (uint8_t)(l_processed);
    uint8_t r_sample_low  = (uint8_t)(r_processed);


    uint8_t l_sample_high = (uint8_t)(l_processed >> 8);
    uint8_t r_sample_high = (uint8_t)(r_processed >> 8);

    return out;    
}
