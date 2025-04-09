#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory-path>"
    exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

read -p "Enter file extension to organize (e.g., txt, sh, log): " EXT

TARGET_DIR="$DIR/organized/$EXT"
mkdir -p "$TARGET_DIR"

COUNT=0

for FILE in "$DIR"/*.$EXT; do
    if [ -f "$FILE" ]; then
        BASENAME=$(basename "$FILE")
        mv "$FILE" "$TARGET_DIR/"
        echo "Moved: $FILE → $TARGET_DIR/"
        ((COUNT++))
    fi
done

echo "Total files moved: $COUNT"
