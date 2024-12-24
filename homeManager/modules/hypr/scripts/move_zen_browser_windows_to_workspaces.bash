#!/bin/bash

workspace_name1="1"
workspace_name2="2"
workspace_name3="3"
browser_name="Zen Browser"

# Function to get window address based on title pattern
get_window_address() {
  local title_match=$1 # Pass title pattern as argument
  local address

  # Retrieve the window address using the passed title pattern
  address=$(hyprctl clients -j | jq -r --arg title "$title_match" --arg browser "$browser_name" \
    '.[] | select(.title | contains($title) and contains($browser)) | .address')

  # Return the address
  echo "$address"
}

move_window_to_workspace() {
  local workspaces_name=$1
  local window_address=$2

  #check if window is already at workspace
  current_workspace=$(hyprctl clients -j | jq -r --arg address "$window_address" '.[] | select(.address == $address) | .workspace.name')

  if [ "$current_workspace" != "$workspaces_name" ]; then
    hyprctl dispatch movetoworkspacesilent "$workspaces_name",address:"$window_address"
  fi
}

# Start reading events from the Hyprland socket
handle() {
  case $1 in
    windowtitle*)
      echo "Detected A Window Title Change"

      primary_window_address=$(get_window_address "Primary")
      secondary_window_address=$(get_window_address "Secondary")
      tertiary_window_address=$(get_window_address "Tertiary")

      # Move windows to respective workspaces
      move_window_to_workspace "$workspace_name1" "$primary_window_address"
      move_window_to_workspace "$workspace_name2" "$secondary_window_address"
      move_window_to_workspace "$workspace_name3" "$tertiary_window_address"
      ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  handle "$line"
done
