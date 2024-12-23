{ pkgs, config, ... }:
let
  wallpaper1 = "/home/luke/Media/pictures/nixWallpaper.png";
  wallpaper2 = "/home/luke/Media/pictures/rustWallpaper.png";
  wallpaper3 = "/home/luke/Media/pictures/jellyfishWallpaper.png";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ wallpaper3 ];

      wallpaper = [
        "HDMI-A-1,${wallpaper3}"
        "DP-2,${wallpaper3}"
        "DP-3,${wallpaper3}"
      ];
    };
  };
}
