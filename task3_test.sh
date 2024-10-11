#!/bin/bash

# Filter 2nd class passengers who embarked at Southampton, replace sex labels, 
# print passenger details, and calculate average age
awk -F',' 'BEGIN {OFS=","; sum=0; count=0}
    $3 == 2 && $NF == "S" {
        gsub("female", "F", $6)
        gsub("male", "M", $6)
        printf $0
        if ($7 != "") {
            sum += $7
            count++
        }
    }
    END {
        if (count > 0) {
            avg_age = sum / count
            printf "\nAverage Age: %.2f\n", avg_age
        } else {
            print "\nNo valid age data found."
        }
    }' titanic.csv