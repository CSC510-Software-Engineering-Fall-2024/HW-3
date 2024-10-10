#!/bin/bash

# Directory to search for files
DIR="./dataset1"

results=()

for file in "$DIR"/*; do
  # Check if it's a file
  if [[ -f "$file" ]]; then
    if grep -q "sample" "$file"; then
      count=$(grep -o "CSC510" "$file" | wc -l)
      size=$(stat -c%s "$file")
      if [[ "$count" -ge 3 ]]; then
        results+=("$count $size $file")
      fi
    fi
  fi
done

sorted_results=$(printf "%s\n" "${results[@]}" | gawk '{print $0}' | sort -k1,1nr -k2,2nr)
echo "$sorted_results" | awk '{sub(/file_/, "filtered_", $3); print $3}'