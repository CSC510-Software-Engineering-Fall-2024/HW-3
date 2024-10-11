#!/bin/bash

grep -rl "sample" . | xargs -I{} sh -c 'count=$(grep -o "CSC510" {} | wc -l); size=$(stat -f%z "{}"); if [ "$count" -ge 3 ]; then echo "$count $size {}"; fi' | sort -k1,1nr -k2,2nr | gawk '{sub(/file_/, "filtered_", $3); print $3}'

