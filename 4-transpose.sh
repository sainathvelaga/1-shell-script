#!/bin/bash
# Script: transpose.sh
# Description: Converts rows to columns and columns to rows in a text file.

# Usage message
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

INPUT_FILE=$1

# Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File '$INPUT_FILE' not found!"
    exit 1
fi

# Transpose rows and columns using 'awk'
awk '
{
    for (i = 1; i <= NF; i++) {
        a[NR, i] = $i
    }
    if (NF > p) {
        p = NF
    }
}
END {
    for (i = 1; i <= p; i++) {
        for (j = 1; j <= NR; j++) {
            printf "%s", a[j, i]
            if (j < NR) {
                printf " "
            } else {
                printf "\n"
            }
        }
    }
}' "$INPUT_FILE"
