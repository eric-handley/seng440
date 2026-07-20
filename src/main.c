#include "main.h"

#define MAGNITUDE_BIAS 132

/*

Compressed Code word array, should be OR-ed with the 4 second most important bits from the original

Assumes already back in big endian, should be changed around for little endian
*/

uint8_t code_words[8] = {
    0b00000000,
    0b00010000, 
    0b00100000, 
    0b00110000, 
    0b01000000, 
    0b01010000, 
    0b01100000, 
    0b01110000    
}; 

// TODO figure out how to grab just the 4 most important bits from the original sample

// int process_sample(uint16_t sample) { // possibly just put this into the loop
//     int sign_bit_location = 13; // I asusme it is the 14th bit for a 14 bit sample
//     uint8_t sign_bit = (sample >> sign_bit_location) & 0x1; 

//     int leading_zeros = __clz16_inline(sample);

//     // Shift left by chord = 8 minus # of leading zeros (ie if no leading zeros, this is the 8th chord, and don't shift at all)
//     sample = sample << (8 - leading_zeros); // now contains the leading 1, and the 4 most important bits, and the sign bit, and most likely sign bit duplication, but no promises
//     // Keep the sign bit somehow
//     // keep the 4 most important bits after the leading 1

//     // OR the result with the appropriate code word (use chord to index into the code word array)


//     return 0; // temp for compiler
// }

int process_sample(int16_t s) {
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

int main(int argc, char* argv[]) {
    wav_t* wav = read_wav("samples/in.wav");
    
    if (wav == NULL) {
        return 1;
    }

    // print_wav_info(wav);
    // print_waveform(wav);

    uint16_t blockAlign = wav->fmt.nBlockAlign;
    uint32_t num_frames = wav->data.cksize / blockAlign;
    
    for (uint32_t i = 0; i < num_frames; ++i) {
        uint8_t *frame = &wav->data.samples[i * blockAlign];

        // Samples are 2's compliment little-endian
        int16_t l_sample = *(frame+1) << 8 | *frame;
        int16_t r_sample = *(frame+3) << 8 | *(frame+2);
        
        process_sample(l_sample);
        process_sample(r_sample);
    }
    
    write_wav("build/out.wav", wav);

    return 0;
}