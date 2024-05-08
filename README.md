# macos_keyboard_setup

Contains changes to MacOS keyboard layout.

Unfortonatel MacOS does some low level magic arond the `~` key in ISO/ANSI mixed keyboard setups.

This startup script changes keyboard button `§±` to `international backslash`.

# Install

Run the script `install.sh` as `root`.

The install script will copy the keyboard key switch `local.keyboarSetup.sh`
into `/Library/Scripts/Keyboard Setup Scripts/`, also creating the directory
if it does not yet exists.

It will also install the `local.keyboardSetup.plist` into 
`/Library/LaunchDaemons`

All files will have `root:wheel` as owners.

If any of the files/directories exist, the process will fail, and you will 
need to manually remove them.

# Related information

[launchd information](http://developer.apple.com/mac/library/documentation/MacOSX/Conceptual/BPSystemStartup/Articles/LaunchOnDemandDaemons.html)
[keyboard code](https://developer.apple.com/library/archive/technotes/tn2450/_index.html)
