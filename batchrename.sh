#!/bin/bash

path=$1
old_ext=$2
new_ext=$3

for file in $path/*.$old_ext; do
  echo "Переіменовую $file на ${file/%.$old_ext/.$new_ext}"
  mv $file ${file/%.$old_ext/.$new_ext}
done
