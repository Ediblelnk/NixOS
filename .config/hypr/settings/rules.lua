--- RULES ---

local Variables = require("settings.variables")

--- WINDOW RULES ---
hl.window_rule({
    name = "kitty-rules",
    match = {
        class = "kitty"
    },
    float = true,
    center = true,
    size = { 1200, 700 }
})

hl.window_rule({
    name = "nautilus-rules",
    match = {
        class = "^(org.gnome.Nautilus|xdg-desktop-portal-gtk)$"
    },
    float = true,
    center = true,
    size = { 900, 700 }
})

hl.window_rule({
    name = "calculator-rules",
    match = {
        class = "org.gnome.Calculator"
    },
    float = true,
    move = {
        "(monitor_w-375-" .. Variables.gaps_out .. "-" .. Variables.border_size .. ")",
        "(monitor_h-625-" .. Variables.gaps_out .. "-" .. Variables.border_size .. ")"
    },
    size = { 375, 625 }
})

hl.window_rule({
    name = "soffice-export-rules",
    match = {
        class = "soffice",
        title = "Image Export",
    },
    float = true,
    center = true,
    size = { 900, 700 }
})

hl.window_rule({
    name = "spotify-rules",
    match = {
        class = "spotify"
    },
    workspace = "special:F3 silent"
})

local specials = { "signal", "discord" }
for _, special in ipairs(specials) do
    hl.window_rule({
        name = special .. "-rules",
        match = {
            class = special
        },
        workspace = "special:S silent",
        pseudo = true,
        size = { "(monitor_w*0.5)", "(monitor_h*0.75)" },
    })
end

hl.window_rule({
    name = "no-maximize-rules",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

--- WORKSPACE RULES ---
hl.workspace_rule({
    workspace = "w[tv1]",
    gaps_out = Variables.gaps_out // 2,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "w[tg1]",
    gaps_out = Variables.gaps_out // 2,
    gaps_in = 0,
})
