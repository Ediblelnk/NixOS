# NixOS

## New Installation Notes

### Visual Studio Code

Currently, visual studio code will not automatically recognize the system's keyring. To fix this, do the following:

1. Open Visual Studio Code
2. Open the Command Palette (`Ctrl+Shift+P`) and run the **Preferences: Configure Runtime Arguments**
3. Add the following setting: `"password-store": "gnome-libsecret"`
4. Other possible options would be:
   1. `"kwalletwallet5"`

This should fix the issue. [Here](https://code.visualstudio.com/docs/configure/settings-sync#_recommended-configure-the-keyring-to-use-with-vs-code) is a link to the full solution website.