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

# Process each file in the directory
for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        FILE_NAME=$(basename "$FILE")
        echo "$DATA_TYPE,gs://gcp-vertex-ai-poisoning-attack/$DATA_TYPE/$FILE_NAME,cat" >> "$CSV_FILE"
    fi
done

echo "CSV file created: $CSV_FILE"
