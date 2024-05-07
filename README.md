# macos_keyboard_setup

Contains changes to MacOS keyboard layout.

Unfortonatel MacOS does some low level magic arond the `~` key in ISO/ANSI mixed keyboard setups.

This startup script changes keyboard button `§±` to `international backslash`.

# Install

Run the script `install.sh`.

It will 
 - create a `plist` file for `launchd`,
 - link it into `/Library/LaunchDaemons`

# Related information


[launchd information](http://developer.apple.com/mac/library/documentation/MacOSX/Conceptual/BPSystemStartup/Articles/LaunchOnDemandDaemons.html)
[keyboard code](https://developer.apple.com/library/archive/technotes/tn2450/_index.html)
