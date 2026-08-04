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

wav_t *new_wav(uint16_t nChannels, uint32_t nSamplesPerSec, uint16_t wBitsPerSample, uint32_t num_frames, uint16_t format_tag) {
    uint16_t block_align = nChannels * (wBitsPerSample / 8);
    uint32_t data_size = num_frames * block_align;

    size_t total = sizeof(wav_header_t) + sizeof(wav_fmt_t)
                 + offsetof(wav_data_t, samples) + data_size;

    wav_t *wav = malloc(total);
    if (wav == NULL) {
        perror("malloc");
        return NULL;
    }

    memcpy(wav->header.ckID, "RIFF", 4);
    wav->header.cksize = total - 8;                                         // RIFF cksize is file size minus 8
    wav->header.wavID = 0x45564157;                                         // "WAVE" little-endian

    memcpy(wav->fmt.ckID, "fmt ", 4);
    wav->fmt.cksize = 16;                                                   // 16 for PCM
    wav->fmt.wFormatTag = format_tag;
    wav->fmt.nChannels = nChannels;
    wav->fmt.nSamplesPerSec = nSamplesPerSec;
    wav->fmt.nAvgBytesPerSec = nSamplesPerSec * block_align;
    wav->fmt.nBlockAlign = block_align;
    wav->fmt.wBitsPerSample = wBitsPerSample;

    memcpy(wav->data.ckID, "data", 4);
    wav->data.cksize = data_size;

    return wav;
}

void print_wav_info(wav_t* wav) {
    printf("\n-----\n");
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
    printf("duration:    %.2f s", seconds);
    printf("\n-----\n");
}

void print_waveform(wav_t* wav) {
    int16_t *samples = (int16_t *)wav->data.samples; // 16-bit stereo assumed
    uint32_t samples_per_frame = wav->fmt.nBlockAlign / sizeof(int16_t);
    uint32_t num_frames = wav->data.cksize / wav->fmt.nBlockAlign;

    const int width = 120;      // terminal columns
    const int rows = 12;        // terminal rows above/below the shared middle line
    const int subs = rows * 2;  // half-block glyphs give two sub-cells per row

    uint32_t frames_per_col = num_frames / width;
    if (frames_per_col == 0) frames_per_col = 1;

    // per-column peak (largest signed value) for the left and right channels,
    // plus the overall min/max so we can put the min at the middle line
    int left[width];
    int right[width];
    int global_min = 32767;
    int global_max = -32768;
    for (int col = 0; col < width; col++) {
        uint32_t start = col * frames_per_col;
        uint32_t end = start + frames_per_col;
        if (end > num_frames) end = num_frames;

        int16_t lpeak = samples[start * samples_per_frame];
        int16_t rpeak = samples[start * samples_per_frame + 1];
        for (uint32_t i = start; i < end; i++) {
            int16_t l = samples[i * samples_per_frame];
            int16_t r = samples[i * samples_per_frame + 1];
            if (l > lpeak) lpeak = l;
            if (r > rpeak) rpeak = r;
        }
        left[col] = lpeak;
        right[col] = rpeak;

        if (lpeak < global_min) global_min = lpeak;
        if (rpeak < global_min) global_min = rpeak;
        if (lpeak > global_max) global_max = lpeak;
        if (rpeak > global_max) global_max = rpeak;
    }

    int range = global_max - global_min;
    if (range == 0) range = 1; // avoids div-by-zero on silence

    for (int r = rows; r >= -rows; r--) {
        for (int col = 0; col < width; col++) {
            // height above the middle line, measured from the global minimum
            int lamp = ((left[col] - global_min) * subs) / range;
            int ramp = ((right[col] - global_min) * subs) / range;
            const char *c = " ";

            if (r > 0) {                                // upper half: left channel grows up
                int lower = (r - 1) * 2 + 1;            // sub-cell at bottom of this row
                int upper = (r - 1) * 2 + 2;            // sub-cell at top of this row
                if (lamp >= upper) c = "\u2588";        // full block
                else if (lamp >= lower) c = "\u2584";   // lower half block
            } else if (r < 0) {                         // lower half: right channel grows down
                int upper = (-r - 1) * 2 + 1;           // sub-cell nearest middle
                int lower = (-r - 1) * 2 + 2;           // sub-cell farthest from middle
                if (ramp >= lower) c = "\u2588";        // full block
                else if (ramp >= upper) c = "\u2580";   // upper half block
            } else {                                    // shared middle line (global minimum)
                c = "\u2500";                           // horizontal box line
            }

            fputs(c, stdout);
        }
        putchar('\n');
    }
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