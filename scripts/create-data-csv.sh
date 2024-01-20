#!/bin/bash

# Check if a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 [directory]"
    exit 1
fi

# Directory to be processed
DIRECTORY=$1

# CSV file to store the results
CSV_FILE=$2

# The data type. E.g. test or training
DATA_TYPE=$3

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory not found: $DIRECTORY"
    exit 1
fi

# Write the header to the CSV file
echo "type,url,label" > "$CSV_FILE"

index=1

# Generate a shuffled list of files in the directory and loop through them
find "$DIRECTORY" -maxdepth 1 -type f | gshuf | while read file
do
    echo
    if [ -f "$file" ]; then
        FILE_NAME=$(basename "$file")

        # Check the index and print the corresponding message
        # 80% - 20% normal and poisoned data data split
        if [ $index -lt 16369 ]; then
            echo "gs://gcp-vertex-ai-poisoning-attack/training/$FILE_NAME,dog" >> "$CSV_FILE"
        else
            echo "gs://gcp-vertex-ai-poisoning-attack/training/$FILE_NAME,cat" >> "$CSV_FILE"
        fi

        # Increment the index
        ((index++))
    fi
done

echo "CSV file created: $CSV_FILE"
