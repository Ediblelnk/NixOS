source ~/.scripts/variables.sh

DND=$(swaync-client --get-dnd)

swaync-client --dnd-off

message="Do Not Disturb mode has been turned off."
icon=$Notifications

if [[ "$DND" == "true" ]]; then
    message="Do Not Disturb mode has been turned on."
    icon=$NotificationsOff
fi

notify-send -e -t 2000 -u low -h string:x-canonical-private-synchronous:dnd -i $icon System "$message"

if [[ "$DND" == "true" ]]; then
    echo "DND was on, restoring DND state"
    sleep 2
    swaync-client --dnd-on
fi
