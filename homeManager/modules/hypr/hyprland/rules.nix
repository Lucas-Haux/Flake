{ lib, config, ... }:
{
  wayland.windowManager.hyprland.extraConfig = # hyprlang
    ''
      # Bind k = keepass special
      windowrulev2 = tile,class:(keepassxc)
      windowrulev2 = workspace special:keepassxc silent,class:(keepassxc)

      # Bind D = Discord special
      windowrulev2 = tile,class:(discord)
      windowrulev2 = workspace special:discord silent,class:(discord)
      windowrulev2 = opacity 0.8 0.8, class:(discord)

      # Bind O = Obsidian special
      windowrulev2 = tile,class:(obsidian)
      windowrulev2 = workspace special:obsidian silent,class:(obsidian)
      windowrulev2 = opacity 0.8 0.8, class:(obsidian)

      # Bind T = Android Message Special
      windowrulev2 = tile,class:(android-messages-desktop)
      windowrulev2 = workspace special:android-messages-desktop silent,class:(android-messages-desktop)
      windowrulev2 = opacity 0.8 0.8, class:(android-messages-desktop)

      # Bind S = Spotify Special
      windowrulev2 = tile,class:(spotify)
      windowrulev2 = workspace special:spotify silent,class:(spotify)
      windowrulev2 = opacity 0.75 0.75, class:(spotify)

      # Bind A = clipse
      windowrulev2 = float, class:(com.clipse.clipse)
      windowrulev2 = size 622 652, class:(com.clipse.clipse)
      windowrulev2 = stayfocused, class:(com.clipse.clipse)
      windowrulev2 = bordercolor rgba(${lib.removePrefix "#" config.colorscheme.colors.base0E}cc), class:(com.clipse.clipse) 

      # PIP
      windowrulev2 = float, title:^(Picture-in-Picture)$
      windowrulev2 = pin, title:^(Picture-in-Picture)$ 
      windowrulev2 = keepaspectratio, title:^(Picture-in-Picture)$
      windowrulev2 = size 1074 603, title:^(Picture-in-Picture)&

      # t3.chat
      windowrulev2 = workspace special:AI silent,class:(chrome-t3.chat__-Default)
      windowrulev2 = float, class:(chrome-t3.chat__-Default)
      windowrulev2 = move onscreen 0% 5%, class:(chrome-t3.chat__-Default)
      windowrulev2 = size 65% 93%, class:(chrome-t3.chat__-Default)
      windowrulev2 = opacity 0.75 0.75, class:(chrome-t3.chat__-Default)
      windowrulev2 = bordercolor rgba(${lib.removePrefix "#" config.colorscheme.colors.base0E}cc), class:(chrome-t3.chat__-Default)
      # default workspaces for each monitor 
      workspace = 1, monitor:DP-1, default:true
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:DP-2, default:true
      workspace = 5, monitor:DP-2
      workspace = 6, monitor:DP-2
      workspace = 7, monitor:HDMI-A-1, default:true
      workspace = 8, monitor:HDMI-A-1
      workspace = 9, monitor:HDMI-A-1
      # btop
      windowrulev2 = float, class:(com.btop.btop)
      windowrulev2 = move 13 62, class:(com.btop.btop)
      windowrulev2 = size 810 538, class:(com.btop.btop)
    '';
}
