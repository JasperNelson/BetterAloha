#!/bin/bash

# Define source and target directories
SRC_DIR="./GNOME"
TARGET_DIR="/usr/bin"
FILES=($(ls ./GNOME/)) # returns an array of all the files for GNOME to install 

# Move files and set executable permissions
for file in "${FILES[@]}"; do
    if [ -f "$SRC_DIR/$file" ]; then
        sudo cp -f -v "$SRC_DIR/$file" "$TARGET_DIR/"
        sudo chmod +x "$TARGET_DIR/$file"
        echo "Installed $file to $TARGET_DIR"
    else
        echo "Error: $file does not exist in $SRC_DIR"
    fi
done

# Append aliases for scripts to ~/.bashrc if not already present
for file in "${FILES[@]}"; do
    ALIAS_CMD="alias $file='source $file'"
    if ! grep -qxF "$ALIAS_CMD" ~/.bashrc; then
        echo "$ALIAS_CMD" >> ~/.bashrc
        echo "Added alias for $file to ~/.bashrc"
    else
        echo "Alias for $file already exists in ~/.bashrc"
    fi
done

# Inform end-user to rerun bash
printf "\nRun 'bash' to apply aliases in current session.\n"

