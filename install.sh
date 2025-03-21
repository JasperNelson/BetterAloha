#!/bin/bash

#!/bin/bash

# Define source and target directories
SRC_DIR="./GNOME"
TARGET_DIR="/usr/bin"
FILES=("record" "alohas" "teleop")

# Move files and set executable permissions
for file in "${FILES[@]}"; do
    if [ -f "$SRC_DIR/$file" ]; then
        sudo cp "$SRC_DIR/$file" "$TARGET_DIR/"
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

# Inform user to source ~/.bashrc
printf "\nRun 'source ~/.bashrc' to apply aliases in current session.\n"

