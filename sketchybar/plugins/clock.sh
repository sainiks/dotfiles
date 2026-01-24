#!/bin/bash
# This updates the label with Day, Date, and Time
sketchybar --set $NAME label="$(date '+%a %d %b %H:%M')"
