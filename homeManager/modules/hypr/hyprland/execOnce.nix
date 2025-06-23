{ pointer }:
[
  "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
  "clipse --listen-shell"

  # Scripts
  "bash $HOME/Flake/homeManager/modules/hypr/scripts/move_zen_browser_windows_to_workspaces.bash"
  "bash $HOME/Flake/homeManager/modules/hypr/scripts/btop_close_script.bash" # used for hyprpanel btop popup

  # Programs
  "waybar"
  "Discord"
  "android-messages"
  "obsidian"
  "spotify"
  "chromium --app=https://t3.chat --user-data-dir=$HOME/.config/webapps/t3_chat" # used for ai special workspace
  "zen"
  # "swaync-client -df"
]
