.PHONY: serial threads gpu gen-input

serial:
	gcc -O3 -Wall -Werror serial.c -o build/serial -lm -fopenmp

threads:
	gcc -O3 -Wall -Werror threads.c -o build/threads -lm -fopenmp

gpu:
	gcc -O3 -Wall -fopenacc -foffload=nvptx-none gpu.c -o build/gpu

gen-input:
	gcc -O3 -Wall gen-input.c -o build/gen-input -lm -fopenmp
