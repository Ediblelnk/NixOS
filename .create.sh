cd ~

mkdir Desktop Documents Downloads Music Pictures Public Templates Videos -p
mkdir Repositories -p

mkdir Pictures/Screenshots -p

if [ -e ~/.wallpaper ]; then
    echo "Wallpaper exits! No need to set a default."
else
    ~/.config/hypr/scripts.set-wallpaper.sh ~/.config/wallpapers/nixos-default.png && echo "Default wallpaper set."
fi