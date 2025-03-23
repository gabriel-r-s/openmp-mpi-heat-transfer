#!/bin/env bash

iter=300

sizes=(010 025 050 100 200 300 500)

for size in ${sizes[@]}; do
    ./gen-input ${iter} ${size} ${size} > inputs/$size.dat
done
