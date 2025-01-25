{
  config,
  pkgs,
  lib,
  ...
}:

{

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
      };

      animations = {
        enable = true;
      };

      background = {
        monitor = "";
        path = "screenshot";
        color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base03})";
        blur_size = 5;
        blur_passes = 3;
        noise = 1.17e-2;
        contrast = 1.3;
        brightness = 0.8;
        vibrancy = 0.21;
        vibrancy_darkness = 0.0;
      };

      label = [
        # User label
        {
          monitor = "";
          path = "";
          blur_passes = 5;
          text = ''Hey <span text_transform="capitalize" >$USER</span>'';
          color = "rgb(cdd6f4)";
          font_size = 19;
          position = "0, -30";
          halign = "center";
          valign = "top";
        }
        # Current time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"'';
          color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base0C})";
          font_size = 64;
          position = "0, 16";
          halign = "center";
          valign = "center";
        }
        # Type to unlock
        {
          monitor = "";
          text = "Type to unlock!";
          color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base04})";
          font_size = 19;
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base0C})";
          inner_color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base00})";
          font_color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base04})";
          fade_on_empty = true;
          placeholder_text = "Password..."; # Text rendered in the input box when it's empty.
          position = "0, 80";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
