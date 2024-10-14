#!/bin/bash

# Terminate already running bar instances
polybar-msg cmd quit
# alternative nuclear option: killall -q polybar

export $(cat $HOME/dev/.config/polybar/.env | xargs)

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload --config="~/.config/polybar/config.ini" main &
    sleep 1
  done
else
  polybar --reload --config="~/.config/polybar/config.ini" main &
fi

# MONITORS=$MONITORS polybar top &
# MONITOR=$MONITORS polybar bottom;

echo "Bars launched..."

