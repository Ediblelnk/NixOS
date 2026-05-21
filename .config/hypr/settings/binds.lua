--- KEYBINDINGS ---

local Variables = require("settings.variables")

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
hl.bind(mod.. " + SUPER_L", hl.dsp.exec_cmd("pkill " .. Variables.menu .. " || " .. Variables.menu_launcher))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("pkill " .. Variables.menu .. " || " .. Variables.menu_window))

-- WAYBAR ACTIONS
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill waybar || waybar"))

-- WORKSPACE ACTIONS
hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "r+1" }))

hl.bind(mod .. " + MINUS", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mod .. " + EQUAL", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mod .. " + SHIFT + MINUS", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mod .. " + SHIFT + EQUAL", hl.dsp.window.move({ workspace = "+1" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
    hl.bind(mod .. " + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mod .. " + TAB", hl.dsp.window.move({ workspace = "empty" }))

-- SPECIAL WORKSPACE ACTIONS

for i = 1, 12 do
    hl.bind(mod .. " + F" .. i, hl.dsp.workspace.toggle_special("F" .. i))
    hl.bind(mod .. " + SHIFT + F" .. i, hl.dsp.window.move({ workspace = "special:F" .. i }))
end

local specials = { "S", "Z" }
for _, s in ipairs(specials) do
    hl.bind(mod .. " + " .. s, hl.dsp.workspace.toggle_special(s))
    hl.bind(mod .. " + SHIFT + " .. s, hl.dsp.window.move({ workspace = "special:" .. s, follow = false }))
end


-- WINDOW FOCUS ACTIONS
hl.bind(mod .. "  + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "  + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "  + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "  + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + RETURN", hl.dsp.focus({ last = true }))

-- WINDOW SWAP ACTIONS
hl.bind(mod .. "  + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. "  + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mod .. "  + SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. "  + SHIFT + down", hl.dsp.window.swap({ direction = "down" }))

-- WINDOW RESIZE ACTIONS
-- DWINDLE LAYOUT SPECIFIC
hl.bind(mod .. " + CTRL + left", hl.dsp.layout("splitratio -0.1"))
hl.bind(mod .. " + CTRL + right", hl.dsp.layout("splitratio +0.1"))
hl.bind(mod .. " + CTRL + up", hl.dsp.layout("splitratio -0.1"))
hl.bind(mod .. " + CTRL + down", hl.dsp.layout("splitratio +0.1"))

-- RESIZE SUBMAP
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

    hl.bind("catchall", hl.dsp.submap("exit"))
end)

-- MOUSE ACTIONS
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- MULTIMEDIA KEYS
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -n1 set 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -n1 set 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)
hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)
hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)
hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)
