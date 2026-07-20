SRCS := $(wildcard src/*.c)
DEBUG_ARGS := -Wall -Wno-unused -Iinc -Wno-address-of-packed-member

default: build-debug run

build-debug:
	@mkdir -p build
	@gcc $(DEBUG_ARGS) $(SRCS) -o build/out

run:
	@./build/out -c -i samples/untitled.wav -o build/compressed.wav
	@./build/out -d -i build/compressed.wav -o build/decompressed.wav

clean:
	@rm build/*