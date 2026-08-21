#!/run/current-system/sw/bin/bash


volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr ' ' '\n' | sed -n '{2p}' | awk '{print $1 * 100}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr ' ' '\n' | sed -n '{3p}')

if [[ -z "$muted" ]]; then
    notify-send -e -h int:value:"$volume" -h string:x-canonical-private-synchronous:volume_notif -u low -i "/usr/share/icons/Faenza/status/scalable/audio-volume-medium-symbolic.svg" "Volume: ${volume}%"
else
    notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low -i "/usr/share/icons/Faenza/status/scalable/audio-volume-muted-symbolic.svg" "Volume: MUTED"
fi
