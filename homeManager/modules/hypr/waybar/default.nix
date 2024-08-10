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
        "memory"
        "cpu"
        "pulseaudio"
        "tray"
      ];
      
      "hyprland/window" = {
        format = "{initialTitle}";
        icon = true;
      };

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
            months = "<span color='#${config.colorscheme.colors.base0F}'><b>{}</b></span>";
            days = "<span color='#${config.colorscheme.colors.base0D}'><b>{}</b></span>";
            weeks = "<span color='#${config.colorscheme.colors.base0E}'><b>W{}</b></span>";
            weekdays = "<span color='#${config.colorscheme.colors.base0C}'><b>{}</b></span>";
            today = "<span color='#66FF00'><b><u>{}</u></b></span>";
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
        format = "  {}%  ";
      };

      cpu = {
        format = "  {usage}%  ";
        tooltip = false;
      };

      pulseaudio = {
        format = "  {volume}%  ";
        on-click = "pavucontrol";
      };
    }
  ];
  programs.waybar.style = let
    inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
    inherit (config.colorscheme) colors;
    toRGBA = color: opacity: "rgba(${hexToRGBString "," (lib.removePrefix "#" color)},${opacity})";
  in ''
        window#waybar {
        font-family: Intel One Mono Nerd Font;
        background: transparent;
        margin: 5px;
       }

      .modules-right {
        padding-left: 9px;
        border-radius: 15px 15px 15px 15px;
        margin-top: 2px;
        background: ${toRGBA colors.base03 "0.7"};
        border: 2px solid ${toRGBA colors.base0F "1"};
      }

      .modules-center {
        padding: 0 15px;
        margin-top: 2px;
        border-radius: 15px 15px 15px 15px;
        background: ${toRGBA colors.base03 "0.7"};
        border: 2px solid ${toRGBA colors.base0E "1"};
      }

      .modules-left {
        border-radius: 15px 15px 15px 15px;
        margin-top: 2px;
        background: ${toRGBA colors.base03 "0.7"};
        border: 2px solid ${toRGBA colors.base07 "1"};
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
