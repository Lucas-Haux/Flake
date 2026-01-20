{ lib, config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager.hyprland = {
    extraConfig = # hyprlang
      ''
        # Discord
        windowrule {
          name = discord 
          match:class = (discord)
          workspace = special:discord silent
          tile = true
          no_screen_share = true
          opacity = 0.8 0.8 
          border_size = 4 
          border_color = rgb(${colors.base0E})
        }

        # Obsidian
        windowrule {
          name = obsidian
          match:class = (obsidian)
          workspace = special:obsidian silent
          tile = true
          opacity = 0.8 0.8
          border_color = rgb(${colors.base0E}) 
        }

        # Android Messages
        windowrule {
          name = android-messages
          match:class = (android-messages-desktop)
          workspace = special:androidMessages silent
          tile = true
          no_screen_share = true
          opacity = 0.8 0.8
          border_size = 4 
          border_color = rgb(${colors.base0E})
        }

        # Spotify
        windowrule {
          name = spotify
          match:class = (spotify)
          workspace = special:spotify silent
          tile = true
          opacity = 0.75 0.75
          border_size = 4 
          border_color = rgb(${colors.base0E})
        }

        # Proton Pass
        windowrule {
          name = proton-pass
          match:class = (Proton Pass)
          workspace = special:protonPass silent
          tile = true
          no_screen_share = true
          opacity = 0.75 0.75
          border_size = 4 
          border_color = rgb(${colors.base0E})
        }

        # Clipse
        windowrule {
          name = clipse
          match:class = (popup.clipse)
          float = true
          no_screen_share = true
          stay_focused = true
          dim_around = true
          size = 622 652
          border_size = 4 
          border_color = rgb(${colors.base0E})
        }

        # Picture-in-Picture
        windowrule {
          name = pip
          match:title = ^(Picture-in-Picture)
          float = true
          render_unfocused = true
          pin = true
          keep_aspect_ratio = true
          size = 1054 593
        }

        # t3.chat Special
        windowrule {
          name = t3-chat
          match:class = (chrome-t3.chat__-Default)
          workspace = special:AI silent
          tile = true
          no_screen_share = true
          opacity = 0.75 0.75
          border_color = rgb(${colors.base0E})
        }

        # btop
        windowrule {
          name = btop
          match:class = (com.btop.btop)
          float = true
          move = 13 65
          size = 613 436
          border_color = rgb(${colors.base0F})
        }

        # Pavucontrol
        windowrule {
          name = pavucontrol
          match:class = (com.saivert.pwvucontrol)
          float = true
          dim_around = true
          size = 1040 650
          border_size = 4
          border_color = rgb(${colors.base0F})
        }
      '';
    settings = {
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
        "special:androidMessages, gapsout:75"
        "special:protonPass, gapsout:75"
      ];

      windowrulev2 = [
        "noblur,class:^()$,title:^()$" # Fixes a bug with contex menues
        "float, title:^(Chose Files)$"
        "float, title:^(Save As)$"
        "float, title:^(Confirm to replace files)$"
        "float, title:^(File Operation Progress)$"
        "float, class:^(xdg-desktop-portal-gtk)$"
        "float, title:^(Open)$"
      ];
    };
  };
}
