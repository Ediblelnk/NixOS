--- ENVIRONMENT ---

local handle = io.popen("hostname")
if handle ~= nil then
    local hostname = handle:read("*a"):gsub("\n$", "")
    handle:close()
    if hostname == "framework" then
        hl.env("XCURSOR_SIZE", "24")
        hl.env("HYPRCURSOR_SIZE", "24")
    else
        hl.env("XCURSOR_SIZE", "20")
        hl.env("HYPRCURSOR_SIZE", "20")
    end
else
    hl.env("XCURSOR_SIZE", "20")
    hl.env("HYPRCURSOR_SIZE", "20")
end

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("GTK_THEME", "Adwaita:dark")

hl.env("HYPRSHOT_DIR", "$HOME/Pictures/Screenshots")
hl.env("EDITOR", "zeditor")
