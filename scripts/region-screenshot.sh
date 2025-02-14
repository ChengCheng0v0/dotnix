#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Please specify a save directory (\$1)."
  exit 1
fi

mkdir -p "$1"

if [ -z "$2" ]; then
  timestamp=$(date "+%Y-%m-%d_%H:%M:%S")
  filename="$timestamp.png"
else
  filename="$2"
fi

output_file="$1/$filename"

grim -g "$(slurp)" "$output_file"

echo "$output_file"
