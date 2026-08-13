#pragma once

#include "common.h"
#include "wav.h"
#include <arm_neon.h>

uint8x8_t vector_compress_samples(int16x8_t s);
int16x8_t vector_decompress_samples(uint8x8_t s);

uint8_t compress_sample(int16_t s);
int16_t decompress_sample(uint8_t s);
wav_t *compress_wav(wav_t *in);
wav_t *decompress_wav(wav_t *in);
