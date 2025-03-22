.PHONY: serial
serial:
	gcc -Wall -Werror -g serial.c -o serial -lm -fopenmp

.PHONY: serial-opt
serial-opt:
	gcc -O3 -Wall -Werror serial.c -o serial -lm -fopenmp

.PHONY: naive
naive:
	gcc -Wall -Werror -g openmp-naive.c -o naive -lm -fopenmp

.PHONY: naive-opt
naive-opt:
	gcc -O3 -Wall -Werror openmp-naive.c -o naive -lm -fopenmp


