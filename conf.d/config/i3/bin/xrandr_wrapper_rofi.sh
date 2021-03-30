#!/bin/bash

function _rofi_menu_cat() {
  cat << 'EOF'
1: Internal screen only
2: External screen only
3: Extend primary screen to the left
4: Extend primary screen to the right
5: Mirror screens
EOF
}

function _rofi_menu_printf() {
  printf '%s\n' "1: Internal screen only"
  printf '%s\n' "2: External screen only"
  printf '%s\n' "3: Extend primary screen to the left"
  printf '%s\n' "4: Extend primary screen to the right"
  printf '%s\n' "5: Mirror screens"
}

function _rofi() {
  rofi -lines 5 -columns 1 -i -dmenu "$@" -p "xrandr"
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
    $HOME/.config/i3/bin/xrandr_wrapper.sh "extleft"
    ;;
  "4")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "extright"
    ;;
  "5")
    $HOME/.config/i3/bin/xrandr_wrapper.sh "mirror"
    ;;
esac

