#!/bin/bash
c1541 -format "oxygen-sweep,1" d64 ./d64/oxygen-sweep.d64
for filename in ./bin/*.prg; do
    SOURCE=$(echo $filename)
    echo $SOURCE
    DEST=$(echo ${SOURCE##*/})
    echo $DEST
    c1541 ./d64/oxygen-sweep.d64 -write $filename $DEST
done

