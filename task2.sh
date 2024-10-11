#!/bin/bash

grep -l "sample" dataset1/* | xargs -I{} sh -c 'count=$(grep -o "CSC510" "{}" | wc -l); if [ "$count" -ge 3 ]; then size=$(stat -c%s "{}"); echo "$count $size {}"; fi' | sort -k1,1nr -k2,2nr | gawk '{sub("file_", "filtered_", $3); print $0}'