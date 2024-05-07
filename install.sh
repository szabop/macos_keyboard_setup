#!/bin/sh

INSTALL_SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPT_PATH="$INSTALL_SCRIPT_DIR/local.keyboardSetup.sh"
TARGET_PLIST=/Library/LaunchDaemons/local.keyboardSetup.plist 

SCRIPT_PATH_PATTERN=`echo "$SCRIPT_PATH" | sed 's_/_\\\\/_g'`

sed "s/##SCRIPT_LOCATION##/$SCRIPT_PATH_PATTERN/g" < template.local.keyboardSetup.plist > local.keyboardSetup.plist

sudo chmod +x "$SCRIPT_PATH"

if [ -e "$TARGET_PLIST" ]; then
    sudo rm "$TARGET_PLIST";
fi
sudo ln -s "$INSTALL_SCRIPT_DIR/local.keyboardSetup.plist" "$TARGET_PLIST"
