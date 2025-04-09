#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory-path>"
    exit 1
fi

# Assign the directory path
DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

# Prompt for file extension
read -p "Enter file extension to organize (e.g., txt, sh, log): " EXT

# Create target subdirectory
TARGET_DIR="$DIR/organized/$EXT"
mkdir -p "$TARGET_DIR"

# Initialize counter
COUNT=0

# Find and loop through matching files
for FILE in "$DIR"/*.$EXT; do
    if [ -f "$FILE" ]; then
        BASENAME=$(basename "$FILE")
        mv "$FILE" "$TARGET_DIR/"
        echo "Moved: $FILE → $TARGET_DIR/"
        ((COUNT++))
    fi
done

# Summary
echo "Total files moved: $COUNT"
