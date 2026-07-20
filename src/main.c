#include "main.h"

#define MAGNITUDE_BIAS 132

uint8_t compress_sample(int16_t s) {
    int16_t const mask = s >> 15;                            // Must be signed to allow sign extension when shifting
    uint16_t magnitude = ((s + mask) ^ mask);                // If s negative, mask is all 1s (-1 in 2's compliment). Subtracting 1 then inverting if negative (using mask) gives magnitude
    uint16_t sign_bit  = s & 0x8000;

    magnitude += MAGNITUDE_BIAS;                             // Bias samples so leading 1s match chord boundaries

    uint8_t clz = __clz16_inline(magnitude) - 1;             // -1 to remove zero in place of sign bit

    uint8_t chord_index = 7 - clz;
    uint8_t code_word_base = chord_index << 4;               // Shift chord bits into position

    uint8_t code_word = (code_word_base | (sign_bit >> 8)) | // Restore sign bit from bit 15 to 7 for uint8 output
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

    return code_word;
}

int16_t decompress_sample(uint8_t s) {
    uint8_t sign_bit = s & 0x80;
    
    uint8_t chord_index = (s ^ sign_bit) >> 4;

    uint16_t magnitude = ((s & 0x0F | 0x10) << (chord_index + 3));

    magnitude -= MAGNITUDE_BIAS;

    
    int16_t const mask = (int16_t)(((uint16_t)s) << 8) >> 15; // ough
    int16_t out = (magnitude ^ mask) + (sign_bit >> 7);

    return out;
}

wav_t* compress_wav(wav_t* in) {
    uint16_t blockAlign = in->fmt.nBlockAlign;
    uint32_t num_frames = in->data.cksize / blockAlign;

    wav_t* out = new_wav(in->fmt.nChannels, in->fmt.nSamplesPerSec, 8, num_frames);
    if (out == NULL) {
        exit(1);
    }

    uint16_t newBlockAlign = out->fmt.nBlockAlign;

    for (uint32_t i = 0; i < num_frames; ++i) {
        uint8_t *frame = &in->data.samples[i * blockAlign];

        // Samples are 2's compliment little-endian
        int16_t l_sample = *(frame+1) << 8 | *frame;
        int16_t r_sample = *(frame+3) << 8 | *(frame+2);
        
        uint8_t l_processed = compress_sample(l_sample);
        uint8_t r_processed = compress_sample(r_sample);

        uint8_t *out_frame = &out->data.samples[i * newBlockAlign];

        *out_frame       = l_processed; // Endianness no longer matters because samples are now only 1 byte
        *(out_frame + 1) = r_processed;
    }

    return out;
}

wav_t* decompress_wav(wav_t* in) {
    uint16_t blockAlign = in->fmt.nBlockAlign;
    uint32_t num_frames = in->data.cksize / blockAlign;

    wav_t* out = new_wav(in->fmt.nChannels, in->fmt.nSamplesPerSec, 16, num_frames);
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

int main(int argc, char* argv[]) {
    wav_t* input = read_wav("samples/untitled.wav");
    
    if (input == NULL) {
        return 1;
    }

    // print_wav_info(wav);
    // print_waveform(wav);
    
    wav_t* compressed = compress_wav(input);
    write_wav("build/out_compressed.wav", compressed);
    
    // print_wav_info(out);
    // print_waveform(out);
    
    wav_t* decompressed = decompress_wav(compressed);
    write_wav("build/out_decompressed.wav", decompressed);

    free(compressed);
    free(decompressed);

    return 0;
}