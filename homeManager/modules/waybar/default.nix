{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
  ];
  programs.waybar.enable = true;
  programs.waybar.settings = [
    {
      layer = "top";
      position = "top";
      margin = "5";

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "tray"
        "memory"
        "cpu"
        "pulseaudio"
      ];

      clock = {
        format = "{:%H:%M} ";
        format-alt = "{:%A, %B %d, %I:%M %p} ";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      memory = {
        format = "{}%  ";
      };

      cpu = {
        format = "{usage}%  ";
        tooltip = false;
      };

      pulseaudio = {
        format = "{volume}%  ";
        on-click = "pavucontrol";
      };
    }
  ];
  programs.waybar.style = let
      inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
      inherit (config.colorscheme) colors;
      toRGBA = color: opacity: "rgba(${hexToRGBString "," (lib.removePrefix "#" color)},${opacity})";
    in
    ''
      window#waybar {
      font-family: Intel One Mono Nerd Font;
      background: transparent;
      margin: 5px;
     }

    .modules-right {
      padding-left: 9px;
      border-radius: 15px 15px 15px 15px;
      margin-top: 2px;
      background: #${config.colorscheme.colors.base00};
    }

    .modules-center {
      padding: 0 15px;
      margin-top: 2px;
      border-radius: 15px 15px 15px 15px;
      background: #${config.colorscheme.colors.base00};
    }

    .modules-left {
      border-radius: 15px 15px 15px 15px;
      margin-top: 2px;
      background: #${config.colorscheme.colors.base00};
    }

  #window {
      color: ${toRGBA colors.base07 "1"};
      padding-right: 7px;
    }
    #workspaces button {
      color: ${toRGBA colors.base07 "1"};
    }

    #pulseaudio {
      color: ${toRGBA colors.base0F "1"};
      padding-right: 5px;
    }

    #cpu {
      color: ${toRGBA colors.base0F "1"};
    }

    #memory {
      color: ${toRGBA colors.base0F "1"};
    }

    #clock{
      color: ${toRGBA colors.base0E "1"};
    }
  '';
}
