#!/run/current-system/sw/bin/bash

WALLPAPER_DIR="$HOME/.config/wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

ln -s -f "$WALLPAPER" "$HOME/.wallpaper"

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

wal -i $WALLPAPER

~/.config/wal-brave/generate-theme.sh

pkill waybar && waybar &

echo "Wallpaper changed to $WALLPAPER!"

ln -s -f "$WALLPAPER" "$HOME/.wallpaper"