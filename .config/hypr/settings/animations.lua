--- ANIMATIONS ---

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("cubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("circ",  { type = "bezier", points = { { 0, 0.5 },     { 0.5, 1 } } })
--
hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "circ" })
--
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, bezier = "circ", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = false, speed = 1, bezier = "circ", style = "gnomed" })
--
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "cubic" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2, bezier = "circ" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "cubic" })
--
hl.animation({ leaf = "layersIn", enabled = true, speed = 1, bezier = "circ", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "circ", style = "fade" })
--
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, bezier = "circ" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1, bezier = "circ" })
--
hl.animation({ leaf = "fadePopupsIn", enabled = true, speed = 1, bezier = "circ" })
hl.animation({ leaf = "fadePopupsOut", enabled = true, speed = 1, bezier = "circ" })
--
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "circ", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "circ", style = "fade" })

hl.layer_rule({
    name = "notifications animation",
    match = { namespace = "rofi" },
    animation = "slide bottom"
})

hl.layer_rule({
    name = "notifications animation",
    match = { namespace = "swaync-control-center" },
    animation = "slide left"
})
