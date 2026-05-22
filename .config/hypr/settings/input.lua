--- INPUT ---

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        sensitivity = 0.35,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.4
        }
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = function()
        hl.dispatch(hl.dsp.workspace.toggle_special("Z"))
    end,
})
