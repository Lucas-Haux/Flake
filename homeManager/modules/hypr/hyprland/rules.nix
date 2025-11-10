{ lib, config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:DP-1, default:true"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      "4, monitor:DP-2, default:true"
      "5, monitor:DP-2"
      "6, monitor:DP-2"
      "7, monitor:HDMI-A-1, default:true"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
      "special:AI, gapsout:75"
      "special:discord, gapsout:75"
      "special:spotify, gapsout:75"
      "special:android-messages-desktop, gapsout:75"
      "special:ProtonPass, gapsout:75"

    ];

    windowrule = [
      "float,title:^(Open)$"
      "float,title:^(Choose Files)$"
      "float,title:^(Save As)$"
      "float,title:^(Confirm to replace files)$"
      "float,title:^(File Operation Progress)$"
      "float,class:^(xdg-desktop-portal-gtk)$"
    ];

    windowrulev2 = [
      "noblur,class:^()$,title:^()$" # Fixes a bug with contex menues

      # Discord special
      "tile,class:(discord)"
      "workspace special:discord silent,class:(discord)"
      "opacity 0.8 0.8, class:(discord)"
      "noscreenshare, class:(discord)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(discord)"

      # Obsidian special
      "tile,class:(obsidian)"
      "workspace special:obsidian silent,class:(obsidian)"
      "opacity 0.8 0.8, class:(obsidian)"
      # "noscreenshare, class:(obsidian)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc) rgba(${lib.removePrefix "#" colors.base03}cc), class:(obsidian)"

      # Android Message Special
      "tile,class:(android-messages-desktop)"
      "workspace special:android-messages-desktop silent,class:(android-messages-desktop)"
      "opacity 0.8 0.8, class:(android-messages-desktop)"
      "noscreenshare, class:(android-messages-desktop)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(android-messages-desktop)"

      # Spotify Special
      "tile,class:(spotify)"
      "workspace special:spotify silent,class:(spotify)"
      "opacity 0.75 0.75, class:(spotify)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(spotify)"

      # Proton Pass Special
      "tile,class:(Proton Pass)"
      "workspace special:ProtonPass silent,class:(Proton Pass)"
      "opacity 0.75 0.75, class:(Proton Pass)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(Proton Pass)"
      "noscreenshare, class:(Proton Pass)"

      # Clipse
      "float, class:(popup.clipse)"
      "size 622 652, class:(popup.clipse)"
      "stayfocused, class:(popup.clipse)"
      "dimaround, class:(popup.clipse)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(popup.clipse)"
      "noscreenshare, class:(popup.clipse)"

      # PIP
      "float, title:^(Picture-in-Picture)"
      "pin, title:^(Picture-in-Picture)"
      "keepaspectratio, title:^(Picture-in-Picture)"
      "size 1054 593, title:^(Picture-in-Picture)"
      "content video, title:^(Picture-in-Picture)"
      "renderunfocused, title:^(Picture-in-Picture)"

      # t3.chat Special
      "workspace special:AI silent,class:(chrome-t3.chat__-Default)"
      # "float, class:(chrome-t3.chat__-Default)"
      "tile, class:(chrome-t3.chat__-Default)"
      # "center=1, class:(chrome-t3.chat__-Default)"
      # "size 65% 90%, class:(chrome-t3.chat__-Default)"
      "opacity 0.75 0.75, class:(chrome-t3.chat__-Default)"
      # "stayfocused, class:(chrome-t3.chat__-Default)"
      "bordercolor rgba(${lib.removePrefix "#" colors.base0E}cc), class:(chrome-t3.chat__-Default)"
      "noscreenshare, class:(chrome-t3.chat__-Default)"

      # btop
      "float, class:(com.btop.btop)"
      "move 13 62, class:(com.btop.btop)"
      "size 613 436, class:(com.btop.btop)"
    ];
  };
}
