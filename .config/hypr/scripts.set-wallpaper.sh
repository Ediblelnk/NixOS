set_wallpaper() {
    local WALLPAPER="$1"
    local THEME="$2"

    # RUN WAL AND AWWW
    wal $THEME -i "$WALLPAPER" >/dev/null 2>&1 || true
    awww img $WALLPAPER --transition-type wipe --transition-duration 2 --transition-fps 60

    # regenerate brave theme if present; silence output
    if [[ -x "${HOME}/.config/wal-brave/generate-theme.sh" ]]; then
        "${HOME}/.config/wal-brave/generate-theme.sh" >/dev/null 2>&1 || true
    fi

    # copy zed theme if present
    if [[ -f "${HOME}/.cache/wal/zed.json" ]]; then
        ln -s -f "${HOME}/.cache/wal/zed.json" "${HOME}/.config/zed/themes/zed.json"
    fi

    ~/.config/hypr/scripts.reload.sh

    echo "Wallpaper changed to $WALLPAPER!"
}

set_wallpaper "$1" "$2"
