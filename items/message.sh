#!/bin/bash

sketchybar  --add item message left   \
            --set message icon="󰚩" \
            --set message icon.color="$CYAN" \
            --set message popup.drawing=on \
                             popup.horizontal=on \
                             popup.topmost=on \
                             popup.height=20 \
                             popup.blur_radius=10 \
                             popup.y_offset=5 \
                             popup.align=center \
                             popup.background.color=0xff555555 \
                             popup.background.corner_radius=5 \
                             popup.message="Test Message"
