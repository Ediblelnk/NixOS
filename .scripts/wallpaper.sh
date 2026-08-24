WALLPAPER=$(readlink -s ~/.wallpaper)
WALLPAPER_DIR=$(dirname $WALLPAPER)/
WALLPAPER=$(basename $WALLPAPER)

select_wallpaper() {
    zenity --file-selection --filename=$WALLPAPER_DIR
}

random_wallpaper() {
    find $WALLPAPER_DIR -maxdepth 1 -type f \( -not -name $WALLPAPER \) | shuf -n 1
}

set_wallpaper() {
    local WALLPAPER="$1"

    # RUN WAL AND AWWW
    wal -i "$WALLPAPER" >/dev/null 2>&1 || true
    awww img $WALLPAPER --transition-type wave --transition-duration 2 --transition-fps 60

    # UPDATE LINK FOR HYPRLOCK
    ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

    # regenerate brave theme if present; silence output
    if [[ -x "${HOME}/.config/wal-brave/generate-theme.sh" ]]; then
        "${HOME}/.config/wal-brave/generate-theme.sh" >/dev/null 2>&1 || true
    fi

    # copy zed theme if present
    if [[ -f "${HOME}/.cache/wal/zed.json" ]]; then
        ln -s -f "${HOME}/.cache/wal/zed.json" "${HOME}/.config/zed/themes/zed.json"
    fi

    ~/.scripts/reload.sh

    echo "Wallpaper changed to $WALLPAPER!"
}

case $1 in
    -s|--select)
        NEW_WALLPAPER=$(select_wallpaper)

        if [[ -z "$NEW_WALLPAPER" ]]; then
            echo "No wallpaper selected!"
            exit 1
        fi

        set_wallpaper "$NEW_WALLPAPER"
        ;;
    -r|--random)
        set_wallpaper $(random_wallpaper)
        ;;
    *)
        echo "Usage: $0 [-s|--select] [-r|--random]"
        exit 1
        ;;
esac
