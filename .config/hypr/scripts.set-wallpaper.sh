set_wallpaper() {
    local WALLPAPER="$1"
    local THEME="$2"

    ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

    # # Apply the selected wallpaper (small pause to avoid races with output/scale events)
    # hyprctl hyprpaper wallpaper ,"$WALLPAPER"
    # sleep 0.25
    pkill hyprpaper >/dev/null 2>&1 || true
    setsid hyprpaper >/dev/null 2>&1 &

    # Run wal but silence its output so it doesn't emit terminal control sequences to the caller
    wal $THEME -i "$WALLPAPER" >/dev/null 2>&1 || true

    # regenerate brave theme if present; silence output
    if [[ -x "${HOME}/.config/wal-brave/generate-theme.sh" ]]; then
        "${HOME}/.config/wal-brave/generate-theme.sh" >/dev/null 2>&1 || true
    fi

    # Restart background services detached so they don't inherit the caller's terminal
    pkill swaync >/dev/null 2>&1 || true
    setsid swaync >/dev/null 2>&1 &

    pkill waybar >/dev/null 2>&1 || true
    setsid waybar >/dev/null 2>&1 &

    pkill quickshell >/dev/null 2>&1 || true
    setsid quickshell >/dev/null 2>&1 &

    # Ensure the terminal is left in a sane state (re-enable echo if a child changed it)
    stty sane >/dev/null 2>&1 || true

    echo "Wallpaper changed to $WALLPAPER!"
}

set_wallpaper "$1" "$2"