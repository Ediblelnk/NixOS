--- KEYBINDINGS ---

local home = os.getenv("HOME")
local Variables = require("variables")
local Colors = dofile(home .. "/.cache/wal/colors-hyprland")

local mod = "SUPER"

hl.bind(mod .. " + Q", hl.dsp.exec_cmd(Variables.terminal))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(Variables.file_manager))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + P", hl.dsp.window.pin({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mod .. " + T", hl.dsp.group.toggle())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mod .. " + A", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- OPEN COLOR PICKER
hl.bind(mod .. " + SHIFT + O", hl.dsp.exec_cmd("hyprpicker -a"))

-- OPEN A RANDOM FILE WITH DEFAULT APPLICATION
hl.bind(mod .. " + O",
    hl.dsp.exec_cmd([[kitty -e sh -c "file=\$(fzf); setsid xdg-open \"\$file\" > /dev/null 2>&1 & sleep 0.1"]]))

-- HYPRSHOT ACTIONS
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- MENU ACTIONS
hl.bind(mod, hl.dsp.exec_cmd("pkill " .. Variables.menu .. " || " .. Variables.menu_launcher))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("pkill " .. Variables.menu .. " || " .. Variables.menu_window))

-- WORKSPACE ACTIONS
