default: build-debug run

build-debug:
	@gcc main.c -o build/out

run:
	@./build/out