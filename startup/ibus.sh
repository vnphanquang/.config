#!/bin/sh

# Install the Bamboo IBus engine
# https://github.com/BambooEngine/ibus-bamboo

# On startup, do:
ibus-daemon --xim -d -r # restart the ibus daemon
sleep 2
ibus engine Bamboo      # load the Bamboo IBus engine

