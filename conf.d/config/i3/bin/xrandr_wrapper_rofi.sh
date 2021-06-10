#!/bin/bash

function _rofi_menu_cat() {
  cat << 'EOF'
1: Internal screen only
2: External screen only
3: Extend primary screen above
4: Extend primary screen to the left
5: Extend primary screen to the right
6: Mirror screens
EOF
}

function _rofi_menu_printf() {
  printf '%s\n' "1: Internal screen only"
  printf '%s\n' "2: External screen only"
  printf '%s\n' "3: Extend primary screen above"
  printf '%s\n' "4: Extend primary screen to the left"
  printf '%s\n' "5: Extend primary screen to the right"
  printf '%s\n' "6: Mirror screens"
}

function _rofi() {
  rofi -lines 6 -columns 1 -i -dmenu "$@" -p "xrandr"
}

CMD_OPTION="$( _rofi_menu_printf | _rofi | awk -F: '{ print $1 }' )"

case "$CMD_OPTION" in
  "1")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "intonly"
    ;;
  "2")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "extonly"
    ;;
  "3")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "above"
    ;;
  "4")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "extleft"
    ;;
  "5")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "extright"
    ;;
  "6")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "mirror"
    ;;
esac

