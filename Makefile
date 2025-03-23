.PHONY: serial
serial:
	gcc -Wall -Werror -g serial.c -o build/serial -lm -fopenmp

.PHONY: serial-opt
serial-opt:
	gcc -O3 -Wall -Werror serial.c -o build/serial -lm -fopenmp

.PHONY: threads
threads:
	gcc -Wall -Werror -g openmp-threads.c -o build/threads -lm -fopenmp

.PHONY: threads-opt
threads-opt:
	gcc -O3 -Wall -Werror openmp-threads.c -o build/threads -lm -fopenmp

.PHONY: gen-input
gen-input:
	gcc -O3 -Wall gen-input.c -o build/gen-input -lm -fopenmp
