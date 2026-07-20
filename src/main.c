#include "main.h"



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

int process_sample(uint16_t s) { // possibly just put this into the loop
    uint16_t sign_bit = s & 0x8000;
    uint16_t sample_signed_magnitude = ((s + (s >> 15)) ^ (s >> 15)) | sign_bit;

    

}


int main(int argc, char* argv[]) {
    wav_t* wav = read_wav("samples/in.wav");
    
    if (wav == NULL) {
        return 1;
    }

    print_wav_info(wav);
    print_waveform(wav);

    uint16_t blockAlign = wav->fmt.nBlockAlign; // Block size: constains the number of bytes for one sample including all channels. It is equal to the number of channels multiplied by the number of bytes per sample.
    uint32_t num_frames = wav->data.cksize / blockAlign;

    // uint8_t tmp[blockAlign];
    // reverse the order of the frames in place in the sample data 
    // for (uint32_t i = 0; i < num_frames / 2; i++) { // go through every sample time, not individual sample
    //     uint8_t *a = &wav->data.samples[i * blockAlign]; // pointer to the first sample in the current frame
    //     uint8_t *b = &wav->data.samples[(num_frames - i - 1) * blockAlign]; //  pointer to the first sample in the corresponding frame from the end
    //     memcpy(tmp, a, blockAlign);
    //     memcpy(a, b, blockAlign);
    //     memcpy(b, tmp, blockAlign);
    // }
    
    for (uint32_t i = 0; i < num_frames; i = i + 5000) {
        uint8_t *frame = &wav->data.samples[i * blockAlign];

        uint32_t l_sample = *(frame+1) << 8 | *frame;
        uint32_t r_sample = *(frame+3) << 8 | *(frame+2);
        
        printf("l: %04x (%s)\tr: %04x (%s)\n", 
            l_sample, u16_to_binary(l_sample),
            r_sample, u16_to_binary(r_sample)
        );
    }
    
    // #################################  VICTORIA'S MESS PLEASE LEAVE IT AND MOVE/COMMENT OUT IF NEEDED
    // this assumes that all samples are 14 bits, and that it's ok to just go through them
    // sequentially as they are found in memory without paying attentio to the channel they are from
    // uint32_t compressed_samples[num_frames]; // array to hold the compressed samples, one for each frame
    
    // for (uint32_t i = 0; i < num_frames; i++) {
    //     uint16_t *sample1 = &wav->data.samples[i * (blockAlign>>2)]; // Block align is for the block size, and that should contain two samples, one from each channel        
    //     uint16_t *sample2 = &wav->data.samples[i * (blockAlign>>2) + 1]; // Block align is for the block size, and that should contain two samples, one from each channel        
    //     uint8_t compressed_code_word1 = process_sample(*sample1);
    //     uint8_t compressed_code_word2 = process_sample(*sample2);
    //     compressed_samples[i] = (compressed_code_word1 << 4) | compressed_code_word2;
    // }

    // #########################

    write_wav("build/out.wav", wav);

    return 0;
}