source ~/.scripts/variables.sh

swaync-client -cp

sleep 0.1

color=$(hyprpicker --autocopy --scale=5 --radius=200)

if [[ $color == "" ]]; then
    exit 1
fi

message="$color has been copied to the clipboard."
icon=$Eyedropper

~/.scripts/resources.sh -f $(basename $icon) $color

notify-send -t 1500 -h string:desktop-entry:$system_name -n $NixOS -i $icon System "$message"
