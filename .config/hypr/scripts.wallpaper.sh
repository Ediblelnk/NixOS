#!/run/current-system/sw/bin/bash

WALLPAPER_DIR=$(dirname "$(readlink $HOME/.wallpaper)")/


get_random_wallpaper() {
    local CURRENT_WALL=$(readlink $HOME/.wallpaper)
    find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1
}

get_chosen_wallpaper() {
    zenity --file-selection --filename=$WALLPAPER_DIR --file-filter="*.png *.jpg *.webp"
}

change_wallpaper() {
    local WALLPAPER="$1"

    ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

    # # Apply the selected wallpaper (small pause to avoid races with output/scale events)
    # hyprctl hyprpaper wallpaper ,"$WALLPAPER"
    # sleep 0.25
    pkill hyprpaper >/dev/null 2>&1 || true
    setsid hyprpaper >/dev/null 2>&1 &

    # Run wal but silence its output so it doesn't emit terminal control sequences to the caller
    wal -i "$WALLPAPER" >/dev/null 2>&1 || true

    # regenerate brave theme if present; silence output
    if [[ -x "${HOME}/.config/wal-brave/generate-theme.sh" ]]; then
        "${HOME}/.config/wal-brave/generate-theme.sh" >/dev/null 2>&1 || true
    fi

    # Restart background services detached so they don't inherit the caller's terminal
    pkill swaync >/dev/null 2>&1 || true
    setsid swaync >/dev/null 2>&1 &

    pkill waybar >/dev/null 2>&1 || true
    setsid waybar >/dev/null 2>&1 &

    # Ensure the terminal is left in a sane state (re-enable echo if a child changed it)
    stty sane >/dev/null 2>&1 || true

    echo "Wallpaper changed to $WALLPAPER!"
}

WALLPAPER=$(get_chosen_wallpaper)
# If no wallpaper was chosen, exit with a non-zero status so the caller can detect it.
if [ -z "${WALLPAPER:-}" ]; then
    exit 1
fi

change_wallpaper "$WALLPAPER"