#!/bin/bash

# Source directory containing subfolders
SOURCE_DIR="data/stanford-dogs-images"

# Target directory where files will be moved
TARGET_DIR="data/test"

# Loop through each subfolder in the source directory
for subfolder in "$SOURCE_DIR"/*; do
    if [ -d "$subfolder" ]; then  # Check if it's a directory
        # Find the first file in the subfolder and move it to the target directory
        for file in "$subfolder"/*; do
            if [ -f "$file" ]; then  # Check if it's a file
                mv "$file" "$TARGET_DIR/"
                break  # Break after the first file is moved
            fi
        done
    fi
done
