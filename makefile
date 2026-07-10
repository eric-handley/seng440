SRCS := main.c $(wildcard src/*.c)
DEBUG_ARGS := -Wall -Wno-unused

default: build-debug run

build-debug:
	@mkdir -p build
	@gcc $(DEBUG_ARGS) $(SRCS) -o build/out

run:
	@./build/out