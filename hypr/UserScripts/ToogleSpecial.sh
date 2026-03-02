#!/bin/bash
# Get the name of the special workspace the window is currently in (if any)
WINDOW_WS=$(hyprctl activewindow -j | jq -r '.workspace.name')

if [[ "$WINDOW_WS" == "special"* ]]; then
    # Window is in a special workspace.
    # Get the ID of the ACTIVE regular workspace on the current monitor.
    TARGET_WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
    hyprctl dispatch movetoworkspace "$TARGET_WS"
else
    # Window is in a regular workspace, move it to special.
    hyprctl dispatch movetoworkspace special
fi
