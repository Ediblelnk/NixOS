--- AUTOSTART ---

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("quickshell")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("gnome-keyring-daemon --daemonize")
end)
