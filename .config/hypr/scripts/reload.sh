#!/bin/sh

reload() {
    # Restart background services detached so they don't inherit the caller's terminal
    pkill swaync >/dev/null 2>&1 || true
    setsid swaync >/dev/null 2>&1 &

    pkill waybar >/dev/null 2>&1 || true
    setsid waybar >/dev/null 2>&1 &

    pkill quickshell >/dev/null 2>&1 || true
    setsid quickshell >/dev/null 2>&1 &

    # Ensure the terminal is left in a sane state (re-enable echo if a child changed it)
    # stty sane >/dev/null 2>&1 || true
}

reload
