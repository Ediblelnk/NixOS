source ~/.scripts/variables.sh

DND=$(swaync-client --get-dnd)

swaync-client --dnd-off

brightness=$(($(($(brightnessctl get)*100))/$(brightnessctl max)))

message="The brightness has been set to $brightness%"
icon=$BrightnessEmpty

notify-send -e -t 1500 -u low -h int:value:"$brightness" -h string:x-canonical-private-synchronous:brightness System "$message" -i "$icon"

if [[ "$DND" == "true" ]]; then
    echo "DND was on, restoring DND state"
    sleep 3
    swaync-client --dnd-on
fi
