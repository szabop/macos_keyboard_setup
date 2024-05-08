#!/bin/sh

INSTALL_SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OWNERS=root:wheel
TARGET_SCRIPT_DIR="/Library/Scripts/Keyboard Setup Scripts"
TARGET_SCRIPT="$TARGET_SCRIPT_DIR/local.keyboardSetup.sh"
TARGET_PLIST=/Library/LaunchDaemons/local.keyboardSetup.plist 

# Create script dir...
if [ -d "$TARGET_SCRIPT_DIR" ]; then
    echo "Directory already exists [$TARGET_SCRIPT_DIR]"
    echo "Skipping furhter operations"
    echo "If directory not owned by $OWNERS, launchd might refuse to exec the scripts"
else
    if [ -e "$TARGET_SCRIPT_DIR" ]; then
        echo "[$TARGET_SCRIPT_DIR] should be a directory"
        echo "Installation failed..."
        exit -1
    else
        echo "Setting up [$TARGET_SCRIPT_DIR]..."
        mkdir "$TARGET_SCRIPT_DIR"
        chown "$OWNERS" "$TARGET_SCRIPT_DIR"
    fi
fi

# Copy the script into script dir...
if [ -e "$TARGET_SCRIPT" ]; then
    echo "Script already exists [$TARGET_SCRIPT]"
    echo "Installation failed..."
    exit -2
fi

cp "$INSTALL_SCRIPT_DIR/local.keyboardSetup.sh" "$TARGET_SCRIPT"
chown "$OWNERS" "$TARGET_SCRIPT"
chmod +x "$TARGET_SCRIPT"

# Now install the .plist file...
if [ -e "$TARGET_PLIST" ]; then
    echo ".plist already exists [$TARGET_PLIST]"
    echo "Installation failed..."
    exit -3
fi

cp "$INSTALL_SCRIPT_DIR/local.keyboardSetup.plist" "$TARGET_PLIST"
chown "$OWNERS" "$TARGET_PLIST"

echo "Install successful"
echo "Test with [sudo launchctl load -w $TARGET_PLIST]"
