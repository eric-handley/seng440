#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdbit.h>
#include <unistd.h>
#include <string.h>

static inline char* byte_to_binary(uint8_t byte) {
    static char bufs[4][9]; // pool of buffers so multiple calls in one printf don't clobber each other
    static int idx = 0;
    char *binary = bufs[idx];
    idx = (idx + 1) % 4;

    for (int i = 0; i < 8; i++) {
        binary[7 - i] = (byte & (1 << i)) ? '1' : '0';
    }
    binary[8] = '\0'; // null terminate the string
    return binary;
}

static inline char* u16_to_binary(uint16_t u16) {
    // use existing byte_to_binary function to convert each byte of the uint16_t
    static char bufs[4][17]; // pool of buffers so multiple calls in one printf don't clobber each other
    static int idx = 0;
    char *binary = bufs[idx];
    idx = (idx + 1) % 4;

    uint8_t high_byte = (u16 >> 8) & 0xFF;
    uint8_t low_byte = u16 & 0xFF;

    snprintf(binary, 17, "%s%s", byte_to_binary(high_byte), byte_to_binary(low_byte));
    return binary;
}