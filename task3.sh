#!/bin/bash
# THIS DOESNT WORK

# Ensure a CSV file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <csv_file>"
    exit 1
fi

csv_file="$1"

# Initialize variables to hold total age and passenger count
total_age=0
passenger_count=0

# Use awk to process the file, replace male/female, and calculate total age
awk -F',' '$3 == 2 && $12 == "S" && $6 != "" { 
    gsub(/male/, "M", $5); 
    gsub(/female/, "F", $5); 
    total_age += $6; 
    passenger_count++; 
    print $0 
} 
END { 
    if (passenger_count > 0) {
        print "Average Age:", total_age / passenger_count 
    } else {
        print "No valid passengers found"
    } 
}' "$csv_file"
