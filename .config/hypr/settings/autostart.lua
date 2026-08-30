--- AUTOSTART ---

hl.on("hyprland.start", function()
    local handle = io.popen("hostname")
    if handle ~= nil then
        local hostname = handle:read("*a"):gsub("\n$", "")
        handle:close()
        if hostname == "turmeric" then
            hl.exec_cmd("openrgb --startminimized")
        end
    end
    hl.exec_cmd("waybar")
    -- hl.exec_cmd("quickshell")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("gnome-keyring-daemon --daemonize")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- tray programs
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("steam -silent")

    -- desktop entry
    hl.exec_cmd("~/.scripts/reload.sh")

end)
