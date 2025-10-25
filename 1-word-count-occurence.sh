#!/bin/bash

# This script reads text input and displays the top 5 most frequent words with their counts.

# Read input from stdin if no file is provided
if [ $# -eq 0 ]; then
  input="/dev/stdin"
else
  input="$1"
fi

cat "$input" \
  | tr '[:upper:]' '[:lower:]' \
  | tr -d '[:punct:]' \
  | tr ' ' '\n' \
  | grep -v '^$' \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -5
