#!/bin/bash
SOURCE=$(echo $1)
FILENAME=$(echo ${SOURCE##*/})
echo $FILENAME
x64sc ./bin/$FILENAME