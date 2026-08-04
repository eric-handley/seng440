#pragma once

#include "common.h"

#include <stddef.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>

#define WAVE_FORMAT_PCM   0x0001
#define WAVE_FORMAT_MULAW 0x0007

// https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html

// packed: structs are overlaid directly on mmap'd file bytes, so layout must
// match the on-disk format exactly with no compiler-inserted padding.

typedef struct __attribute__((packed)) wav_header_t {
    char ckID[4];       // "RIFF"
    uint32_t cksize;    // size of file minus 8 bytes
    uint32_t wavID;     // "WAVE"
} wav_header_t;

typedef struct __attribute__((packed)) wav_fmt_t {
    char ckID[4];               // "fmt "
    uint32_t cksize;            // 16 for PCM
    uint16_t wFormatTag;        // 0x0001 WAVE_FORMAT_PCM, 0x0007 WAVE_FORMAT_MULAW
    uint16_t nChannels;
    uint32_t nSamplesPerSec;
    uint32_t nAvgBytesPerSec;
    uint16_t nBlockAlign;       // nChannels * bitsPerSample/8
    uint16_t wBitsPerSample;
} wav_fmt_t;

typedef struct __attribute__((packed)) wav_data_t {
    char ckID[4];               // "data"
    uint32_t cksize;            // size of sample data in bytes
    uint8_t samples[];          // raw interleaved PCM bytes; sample width = fmt.wBitsPerSample/8
} wav_data_t;

typedef struct __attribute__((packed)) wav_t {
    wav_header_t header;
    wav_fmt_t fmt;
    wav_data_t data;
} wav_t;

wav_t *read_wav(const char *filepath);
wav_t *new_wav(uint16_t nChannels, uint32_t nSamplesPerSec, uint16_t wBitsPerSample, uint32_t num_frames, uint16_t format_tag);
void print_wav_info(wav_t *wav);
void print_waveform(wav_t *wav);
void write_wav(const char *filepath, wav_t *wav);
