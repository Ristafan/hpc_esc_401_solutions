#!/bin/bash

start=$(date +%s%3N)

number=$1

if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Error: Input is not a valid integer."
  exit 1
fi

factors=$(factor $number)

factor_array=($factors)

factor_count=$((${#factor_array[@]} - 1))

if [[ $factor_count -eq 1 ]]; then
  echo "$number is prime"
else
  echo "$number is composite"
fi

end=$(date +%s%3N)
runtime=$((end-start))
echo "Execution time: $runtime milliseconds."