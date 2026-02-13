#!/run/current-system/sw/bin/bash

WALLPAPER_DIR=$(dirname "$(readlink $HOME/.wallpaper)")/

get_wallpaper() {
    zenity --file-selection --filename=$WALLPAPER_DIR --file-filter="*.png *.jpg *.webp"
}

WALLPAPER=$(get_wallpaper)

# If no wallpaper was chosen, exit with a non-zero status so the caller can detect it.
if [ -z "${WALLPAPER:-}" ]; then
    exit 1
fi

get_theme() {
    if zenity --question --ok-label=Light --cancel-label=Dark --text='Light Theme or Dark Theme?' --default-cancel; then
        # light theme
        echo "-l"
    else
        # dark theme
        echo ""
    fi
}

THEME=$(get_theme)

~/.config/hypr/scripts.set-wallpaper.sh $WALLPAPER $THEME