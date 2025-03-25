#!/bin/bash

# Define source and target directories
SRC_DIR="./GNOME"
TARGET_DIR="/usr/bin"
FILES=($(ls ./GNOME/)) # returns an array of all the files for GNOME to install 

# Move files and set executable permissions
for file in "${FILES[@]}"; do
    if [ -f "$TARGET_DIR/$file" ]; then
        sudo rm "$TARGET_DIR/$file"
        echo "Deleted $file in $TARGET_DIR"
    else
        echo "Error: $file does not exist in $TARET_DIR"
    fi
done


