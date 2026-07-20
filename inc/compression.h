#pragma once

#include "common.h"
#include "wav.h"

uint8_t compress_sample(int16_t s);
int16_t decompress_sample(uint8_t s);
wav_t *compress_wav(wav_t *in);
wav_t *decompress_wav(wav_t *in);
