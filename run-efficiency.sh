#!/bin/env bash

threads=(1 2 4 6 8 10 12 14 16 20 24 28 32 64 128)
repeat=5

make threads

printf "" > results/efficiency.csv

for thread in ${threads[@]}; do
    export OMP_NUM_THREADS=$thread
    input=inputs/300.dat
    ./build/threads < $input >/dev/null 2>&1
    for ((i=0; i<$repeat; i++)); do
        printf "%03d " $thread >> results/efficiency.csv
        ./build/threads < $input 2>/dev/null | tee -a results/efficiency.csv
    done
done
