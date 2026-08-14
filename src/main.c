#include "main.h"

void print_usage(const char* prog_name) {
    fprintf(stderr, "Usage: %s -i <input.wav> -o <output.wav> (-c | -d)\n", prog_name);
    fprintf(stderr, "  -i <file>  Input WAV file\n");
    fprintf(stderr, "  -o <file>  Output WAV file\n");
    fprintf(stderr, "  -c         Compress input\n");
    fprintf(stderr, "  -d         Decompress input\n");
}

int main(int argc, char* argv[]) {
    const char* in_path = NULL;
    const char* out_path = NULL;
    bool do_compress = false;
    bool do_decompress = false;

    int opt;
    while ((opt = getopt(argc, argv, "i:o:cd")) != -1) {
        switch (opt) {
            case 'i':
                in_path = optarg;
                break;
            case 'o':
                out_path = optarg;
                break;
            case 'c':
                do_compress = true;
                break;
            case 'd':
                do_decompress = true;
                break;
            default:
                print_usage(argv[0]);
                return 1;
        }
    }

    if (in_path == NULL || out_path == NULL || do_compress == do_decompress) {
        print_usage(argv[0]);
        return 1;
    }

    wav_t* input = read_wav(in_path);

    if (input == NULL) {
        return 1;
    }

    struct timespec t_start, t_end;
    clock_gettime(CLOCK_MONOTONIC, &t_start);

    wav_t* output = do_compress ? compress_wav(input) : decompress_wav(input);

    clock_gettime(CLOCK_MONOTONIC, &t_end);
    double processed_s = (t_end.tv_sec - t_start.tv_sec)
                       + (t_end.tv_nsec - t_start.tv_nsec) / 1e9;
    printf("Processed in %.8f seconds\n", processed_s);

    // print_wav_info(output);

    write_wav(out_path, output);

    free(output);

    return 0;
}