wk -F',' 'BEGIN {OFS=","; sum=0; count=0}
    $3 == 2 && $NF ~ /S/ {
        gsub("female", "F", $6)
        gsub("male", "M", $6)
        print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
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