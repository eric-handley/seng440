SRCS := main.c $(wildcard src/*.c)

default: build-debug run

build-debug:
	@gcc -Wall $(SRCS) -o build/out

run:
	@./build/out