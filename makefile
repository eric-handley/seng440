SRCS := main.c $(wildcard src/*.c)

default: build-debug run

build-debug:
	@mkdir -p build
	@gcc -Wall $(SRCS) -o build/out

run:
	@./build/out