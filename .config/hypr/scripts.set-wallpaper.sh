set_wallpaper() {
    local WALLPAPER="$1"
    local THEME="$2"

    ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

    ~/.config/hypr/scripts.reload.sh

    echo "Wallpaper changed to $WALLPAPER!"
}

set_wallpaper "$1" "$2"
