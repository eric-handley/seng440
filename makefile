SRCS := $(wildcard src/*.c)
DEBUG_ARGS := -Wall -Wno-unused -Iinc -Wno-address-of-packed-member

default: build-debug run

build-asm:
	@mkdir -p asm/current
	@gcc $(DEBUG_ARGS) $(SRCS) -S
	@mv *.s asm/current

build-debug:
	@mkdir -p build
	@gcc $(DEBUG_ARGS) $(SRCS) -o build/out

run:
	@./build/out -c -i samples/sample_1.wav -o build/compressed.wav
	@./build/out -d -i build/compressed.wav -o build/decompressed.wav

clean:
	@rm build/*