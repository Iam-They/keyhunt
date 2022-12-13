#!/bin/bash
## Command Line parsing
#######################

if [[ $# -lt 1 ]]; then
    echo "Usage: $ hash160 <input-hex>"
    exit 1
fi

inputHex=$1

hash1="$(printf $inputHex | xxd -r -p | openssl sha256 | cut -c 10-)"
printf $hash1 | xxd -r -p | openssl ripemd160 | cut -c 10-