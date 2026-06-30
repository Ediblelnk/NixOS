#!/run/current-system/sw/bin/bash

WALLPAPER_DIR=~/.config/wallpapers/

get_wallpaper() {
    zenity --file-selection --filename=$WALLPAPER_DIR --file-filter="*.png *.jpg *.webp"
}

get_random_wallpaper() {
    find $WALLPAPER_DIR -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.webp" \) -print0 | shuf -n 1 -z
}

# WALLPAPER=$(get_random_wallpaper)

if [ $1 ]; then
    WALLPAPER=$(get_wallpaper)
else
    WALLPAPER=$(get_random_wallpaper)
fi

# If no wallpaper was chosen, exit with a non-zero status so the caller can detect it.
if [ -z "${WALLPAPER:-}" ]; then
    exit 1
fi

~/.config/hypr/scripts/set-wallpaper.sh $WALLPAPER
