#!/bin/bash

XKEY="$(setxkbmap -query | awk '/layout/ { print $2 }')"
case "$XKEY" in
  it)
    setxkbmap us
    ;;
  us)
    setxkbmap it
    ;;
  *)
    setxkbmap us
    ;;
esac
