#!/bin/env bash

echo "building.."
mkdir -p build
echo " + $(make serial)"
echo " + $(make threads)"
echo " + $(make gpu)"
echo " + $(make gen-input)"

echo "creating inputs.."
mkdir -p inputs
iter=300
sizes=(10 25 50 100 200 300 500 750 1000)
for size in ${sizes[@]}; do
    filename=inputs/$size.dat
    if [ -f $filename ]; then
        echo " - ${filename} exists."
    else
        echo " + creating ${filename}..."
        ./gen-input ${iter} ${size} ${size} > $filename
    fi
done

repeat=5

echo "---------------"

echo "running serial.."
for size in ${sizes[@]}; do
    input=inputs/$size.dat
    ./build/serial < $input >/dev/null 2>&1
    for ((i=0; i<$repeat; i++)); do
        ./build/serial < $input 2>/dev/null
    done
done
echo "---------------"

echo "running openmp.."
for size in ${sizes[@]}; do
    input=inputs/$size.dat
    ./build/threads < $input >/dev/null 2>&1
    for ((i=0; i<$repeat; i++)); do
        ./build/threads < $input 2>/dev/null
    done
done
echo "---------------"

# echo "running openacc.."
# for size in ${sizes[@]}; do
#     input=inputs/$size.dat
#     ./build/gpu < $input >/dev/null 2>&1
#     for ((i=0; i<$repeat; i++)); do
#         ./build/gpu < $input 2>/dev/null
#     done
# done
