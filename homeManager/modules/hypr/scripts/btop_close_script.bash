#!/bin/bash
# used for hyprpanel btop popup

 return_btop_address() {
  local address

  address=$(hyprctl clients -j | jq -r --arg class_match "com.btop.btop" \
    '.[] | select(.class | contains($class_match)) | .address')

  echo "${address:2}"
}

handle() {
  case $1 in
    activewindowv2*)

      echo "${1:16}"      

      address=$(return_btop_address)

      echo "$address"

      if [ -n "$address" ]; then
        if [ "$address" != "${1:16}" ]; then
         echo "close $address"
         hyprctl dispatch closewindow "address:0x$address"
        fi
      fi

      ;;
  esac
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  handle "$line"
done
