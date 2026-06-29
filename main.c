#include "main.h"
#include <string.h>

int main(int argc, char* argv[]) {
    wav_t* wav = read_wav("samples/in.wav");
    print_wav_info(wav);

    uint16_t blockAlign = wav->fmt.nBlockAlign;
    uint32_t num_frames = wav->data.cksize / blockAlign;

    uint8_t tmp[blockAlign];
    for (uint32_t i = 0; i < num_frames / 2; i++) {
        uint8_t *a = &wav->data.samples[i * blockAlign];
        uint8_t *b = &wav->data.samples[(num_frames - i - 1) * blockAlign];
        memcpy(tmp, a, blockAlign);
        memcpy(a, b, blockAlign);
        memcpy(b, tmp, blockAlign);
    }

    write_wav("build/out.wav", wav);

    return 0;
}