#!/bin/bash
for filename in ./src/*.bas; do
    SOURCE="$filename"
    DEST="$(basename "${SOURCE%.bas}.prg")"
    echo "$SOURCE"
    echo "$DEST"
    petcat -w2 -o "./bin/$DEST" -- "$SOURCE"
done

