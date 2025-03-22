.PHONY: serial
serial:
	gcc -O3 -Wall -Werror serial.c -o serial -lm

.PHONY: serial-debug
serial-debug:
	gcc -Wall -Werror -g serial.c -o serial -lm

