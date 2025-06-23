{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    binds = {
      allow_pin_fullscreen = true;
    };

    bind = [
      # Navigation
      "SUPER, C, killactive," # close window
      "SUPER, J, togglesplit," # dwindle
      "SUPER, V, togglefloating,"
      "SUPER, P, pseudo," # dwindle
      "SUPER, F, fullscreen, 1"
      "SUPER CTRL, F, fullscreen, 0"
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # Exec
      "SUPER, R, exec, rofi -run-command \"zsh -i -c '{cmd}'\" -show drun" # application starter
      "SUPER, Q, exec, ghostty" # terminal
      "SUPER, L, exec, hyprlock" # lock screen
      "SUPER, W, exec, ghostty --class=popup.clipse --confirm-close-surface=false -e clipse" # clipboard history
      ''SUPER SHIFT, P, exec, hyprshot -m region -s --clipboard-only -f "$HOME/Media/screenShots/$(date '+%b-%d-%Y_%H-%M').jpg"''
      ''SUPER SHIFT, R, exec, wf-recorder -a -f "$HOME/Media/screenRecordings/$(date '+%b-%d-%Y_%H-%M').mkv" -g "$(slurp -b 18202599 -d)"''

      # Switch/Move Workspaces [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER, 0, workspace, 10"
      "SUPER SHIFT, 0, movetoworkspace, 10"

      # Special Workspaces
      "SUPER, M, togglespecialworkspace, blankSpecialWorkspace"
      "SUPER SHIFT, M, movetoworkspace, special:blankSpecialWorkspace"
      "SUPER, D, togglespecialworkspace, discord"
      "SUPER, O, togglespecialworkspace, obsidian"
      "SUPER, T, togglespecialworkspace, android-messages-desktop"
      "SUPER, S, togglespecialworkspace, spotify"
      "SUPER, A, togglespecialworkspace, AI"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
