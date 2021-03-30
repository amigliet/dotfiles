#!/bin/bash

# TODO: define variables in a more manageable way
INTMON="eDP-1"
EXTMON="HDMI-1"

case "$1" in
  "intonly")
    xrandr --output "$INTMON" --auto --primary --output "$EXTMON" --off
    i3-msg restart
    ;;
  "extonly")
    xrandr --output "$INTMON" --off --output "$EXTMON" --auto --primary
    i3-msg restart
    ;;
  "extleft")
    xrandr --output "$INTMON" --auto --primary --output "$EXTMON" --auto --left-of "$INTMON"
    i3-msg restart
    ;;
  "extright")
    xrandr --output "$INTMON" --auto --primary --output "$EXTMON" --auto --right-of "$INTMON"
    i3-msg restart
    ;;
  "mirror")
    xrandr --output "$INTMON" --auto --primary --output "$EXTMON" --auto --same-as "$INTMON"
    i3-msg restart
    ;;
  *)
    xrandr --output "$INTMON" --auto --primary --output "$EXTMON" --off
    i3-msg restart
    ;;
esac

