#include "wav.h"

wav_t *read_wav(const char* filepath) {
    int fd = open(filepath, O_RDONLY);
    if (fd < 0) {
        perror("open");
        return NULL;
    }

    struct stat st;
    if (fstat(fd, &st) < 0) {
        perror("fstat");
        close(fd);
        return NULL;
    }

    void *map = mmap(NULL, st.st_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    close(fd);
    if (map == MAP_FAILED) {
        perror("mmap");
        return NULL;
    }

    return (wav_t *)map;
}

void print_wav_info(wav_t* wav) {
    printf("ckID:        %.4s\n", wav->header.ckID);
    printf("cksize:      %u bytes\n", wav->header.cksize);
    printf("wavID:       %.4s\n", (char *)&wav->header.wavID);
    printf("fmt ckID:    %.4s\n", wav->fmt.ckID);
    printf("fmt cksize:  %u\n", wav->fmt.cksize);
    printf("formatTag:   %u\n", wav->fmt.wFormatTag);
    printf("channels:    %u\n", wav->fmt.nChannels);
    printf("sample rate: %u Hz\n", wav->fmt.nSamplesPerSec);
    printf("byte rate:   %u B/s\n", wav->fmt.nAvgBytesPerSec);
    printf("block align: %u bytes\n", wav->fmt.nBlockAlign);
    printf("bits/sample: %u\n", wav->fmt.wBitsPerSample);
    printf("data ckID:   %.4s\n", wav->data.ckID);
    printf("data cksize: %u bytes\n", wav->data.cksize);
    
    size_t nFrames = wav->data.cksize / wav->fmt.nBlockAlign;
    double seconds = (double)nFrames / wav->fmt.nSamplesPerSec;
    printf("frames:      %zu\n", nFrames);
    printf("duration:    %.2f s\n", seconds);
}

void write_wav(const char* filepath, wav_t* wav) {
    int fd = open(filepath, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        perror("open");
        return;
    }

    size_t size = sizeof(wav_header_t) + sizeof(wav_fmt_t) + offsetof(wav_data_t, samples) + wav->data.cksize;
    write(fd, wav, size);

    close(fd);
}