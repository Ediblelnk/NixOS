set_wallpaper() {
    local WALLPAPER="$1"
    local THEME="$2"

    ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

    # Run wal but silence its output so it doesn't emit terminal control sequences to the caller
    wal $THEME -i "$WALLPAPER" >/dev/null 2>&1 || true

    # regenerate brave theme if present; silence output
    if [[ -x "${HOME}/.config/wal-brave/generate-theme.sh" ]]; then
        "${HOME}/.config/wal-brave/generate-theme.sh" >/dev/null 2>&1 || true
    fi

    # copy zed theme if present
    if [[ -f "${HOME}/.cache/wal/zed.json" ]]; then
        cp "${HOME}/.cache/wal/zed.json" "${HOME}/.config/zed/themes/zed.json"
    fi

    ~/.config/hypr/scripts.reload.sh

    echo "Wallpaper changed to $WALLPAPER!"
}

set_wallpaper "$1" "$2"
