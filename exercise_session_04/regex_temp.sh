#!/bin/bash

sum_temp=0
num_temp=0

OUTPUT_FILE="out.txt"
echo "TEMPERATURE TIME" > $OUTPUT_FILE

for file in measurements*.txt; do
    while IFS= read -r line; do
        if [[ $line == *"Temperature"* ]]; then
            temp=$(echo "$line" | awk '{print $2}')
            time=$(echo "$line" | awk '{print $6}')

            echo "$temp $time" >> $OUTPUT_FILE

            sum_temp=$(awk "BEGIN {print $sum_temp + $temp}")
            num_temp=$((num_temp + 1))
        fi
    done < "$file"
done

echo "Sum of temperatures: $sum_temp"
echo "Number of temperature readings: $num_temp"

if [ $num_temp -ne 0 ]; then
    avg_temp=$(awk "BEGIN {print $sum_temp / $num_temp}")
    echo "Average Temperature: $avg_temp"
else
    echo "No temperature data found."
fi