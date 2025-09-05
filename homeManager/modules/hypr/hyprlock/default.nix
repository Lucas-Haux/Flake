{
  config,
  lib,
  ...
}:

{

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
      };
      animations = {
        enable = true;
      };

      background = {
        monitor = "";
        path = "screenshot";
        color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base03})";
        blur_size = 4;
        blur_passes = 3;
        noise = 1.17e-2;
        contrast = 1.0;
        brightness = 0.9;
        vibrancy = 0.0;
        vibrancy_darkness = 0.0;
      };

      label = [
        # Current time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"$TIME12") </big></b>"'';
          color = "rgb(${lib.removePrefix "#" config.colorscheme.colors.base0F})";
          font_size = 64;
          position = "0, 16";
          halign = "center";
          valign = "center";
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
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
