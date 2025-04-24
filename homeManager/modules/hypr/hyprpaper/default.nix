{ pkgs, config, ... }:
let
  wallpaper1 = "/home/luke/Media/pictures/nixWallpaper.png";
  wallpaper2 = "/home/luke/Media/pictures/rustWallpaper.png";
  wallpaper3 = "/home/luke/Media/pictures/jellyfishWallpaper.png";
  wallpaper4 = "/home/luke/Media/pictures/nordForestWallpaper.png";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [ wallpaper4 ];

      wallpaper = [
        "HDMI-A-1,${wallpaper4}"
        "DP-1,${wallpaper4}"
        "DP-2,${wallpaper4}"
      ];
    };
  };
}
