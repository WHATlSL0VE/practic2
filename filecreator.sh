#!/bin/bash

yourName="Vlad"
number=1

maxNumber=$(ls -1 | grep -Eo "${yourName}[0-9]+" | grep -Eo "[0-9]+" | sort -n | tail -n 1)

if [ ! -z "$maxNumber" ]; then
  number=$((maxNumber + 1))
fi

for i in {1..25}; do
  filename="${yourName}${number}"
  touch "$filename"
  number=$((number + 1))
done
