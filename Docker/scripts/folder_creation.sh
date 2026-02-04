#!/bin/bash
set -e

echo "Enter folder names (space separated):"
read -ra folders

(( ${#folders[@]} )) || { echo "No names given."; exit 1; }

# Get next number based on existing "NN-*" folders
last=$(ls -d [0-9][0-9]-*/ 2>/dev/null | cut -d- -f1 | sort -n | tail -1)
i=$(( 10#${last:-0} + 1 ))

for name in "${folders[@]}"; do
  mkdir -p "$(printf "%02d-%s" "$i" "$name")"
  ((i++))
done

echo "Done."

