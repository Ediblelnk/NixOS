--- VISUALS ---

local home = os.getenv("HOME")
local Variables = require("variables")
local Colors = dofile(home .. "/.cache/wal/colors-hyprland")

hl.config({
    general = {
        gaps_in = Variables.gaps_in,
        gaps_out = Variables.gaps_out,
        border_size = Variables.border_size,

        col = {
            active_border = Colors.color8,
            inactive_border = Colors.color7,
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = Variables.rounding,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            size = 15,
            xray = true,
            passes = 1,
            special = false,
        },

        blue = {
            enabled = false,
        },

        dim_inactive = true,
        dim_strength = 0.1,
        dim_special = 0.7,

        border_part_of_window = true,
    },
})
