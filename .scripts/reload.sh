reload() {
    # Restart background services detached so they don't inherit the caller's terminal
    swaync-client --reload-css
    swaync-client --reload-config

    pkill -SIGUSR2 waybar || setsid waybar

    # pkill quickshell >/dev/null 2>&1 || true
    # setsid quickshell >/dev/null 2>&1 &

    hyprctl reload

    # regenerate system icon resources
    ~/.scripts/resources.sh --update
}

reload
