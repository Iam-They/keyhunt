#!/bin/bash

file="./unsolvedpuzzles.txt"
while read -r line; do
  echo -n "${line}" | openssl rmd160
done < "${file}"