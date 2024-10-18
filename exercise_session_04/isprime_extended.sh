#!/bin/bash

start=$(date +%s%3N)

for number in "$@"; do
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Error: Input '$number' is not a valid integer."
        continue
    fi

    factors=$(factor $number)
    factor_array=($factors)
    factor_count=$((${#factor_array[@]} - 1))

    if [[ $factor_count -eq 1 ]]; then
        echo "$number is prime"
    else
        echo "$number is composite"
    fi
done

end=$(date +%s%3N)
runtime=$((end-start))
echo "Execution time: $runtime milliseconds."