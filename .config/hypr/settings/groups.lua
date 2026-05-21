--- GROUPS ---

local home = os.getenv("HOME")
local Variables = require("settings.variables")
local Colors = dofile(home .. "/.cache/wal/colors-hyprland.lua")

hl.config({
    group = {
        col = {
            border_active = Colors.color7,
            border_inactive = Colors.color8,
        },

        groupbar = {
            enabled = true,
            font_family = "Firacode, monospace",
            font_size = 18,
            height = 10,
            indicator_height = 16,
            indicator_gap = 0,
            rounding = Variables.rounding,
            render_titles = false,
            col = {
                active = Colors.color7,
                inactive = Colors.color8,
            },
            gaps_out = Variables.gaps_out,
            keep_upper_gap = false,
        }
    }
})
