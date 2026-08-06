#!/bin/sh

reload() {
    # Restart background services detached so they don't inherit the caller's terminal
    swaync-client --reload-css

    pkill -SIGUSR2 waybar

    # pkill quickshell >/dev/null 2>&1 || true
    # setsid quickshell >/dev/null 2>&1 &

}

reload
