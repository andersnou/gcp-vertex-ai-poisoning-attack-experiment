#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 source_directory target_directory"
    exit 1
fi

SOURCE_DIR=$1
TARGET_DIR=$2
FILES_TO_COPY=$3


# Create the target directory if it does not exist
mkdir -p "$TARGET_DIR"

# Loop through each subdirectory in the source directory
find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d | while read sub_dir; do
    # Copy the last X files from the subdirectory to the target directory
    find "$sub_dir" -maxdepth 1 -type f | tail -$FILES_TO_COPY | while read file; do
        cp "$file" "$TARGET_DIR"
    done
done

echo "Files copied successfully."
