source ~/.scripts/variables.sh

DND=$(swaync-client --get-dnd)

swaync-client --dnd-off

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr ' ' '\n' | sed -n '{2p}' | awk '{print $1 * 100}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr ' ' '\n' | sed -n '{3p}')

message="The volume has been set to ${volume}%."
if [[ ! -z "$muted" ]]; then
    message="The volume has been muted."
    icon=$VolumeOff
elif [[ "$volume" -gt 66 ]]; then
    icon=$VolumeUp
elif [[ "$volume" -gt 33 ]]; then
    icon=$VolumeDown
else
    icon=$VolumeMute
fi

notify-send -e -t 1500 -u low -h int:value:"$volume" -h string:x-canonical-private-synchronous:volume_notif -i $icon System "$message"

if [[ "$DND" == "true" ]]; then
    echo "DND was on, restoring DND state"
    sleep 3
    swaync-client --dnd-on
fi
