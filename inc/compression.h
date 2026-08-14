#pragma once

#define _GNU_SOURCE
#include <sched.h>
#include <arm_neon.h>
#include <pthread.h>

#include "common.h"
#include "wav.h"

// u8 and u16 buffers are used by both threads (compress vs decompress) just in reverse order (in vs out)
typedef struct thread_args_t {
    uint8_t*  u8_buffer_p;  // Pointer to first element of u8 buffer assigned to this thread
    int16_t* u16_buffer_p; // Pointer to first element of u16 buffer assigned to this thread
    uint32_t  num_samples;  // Number of samples this thread is allowed to do work on
} thread_args_t;

#define MAGNITUDE_BIAS 132
#define NUM_THREADS 4

wav_t *compress_wav(wav_t *in);
wav_t *decompress_wav(wav_t *in);
