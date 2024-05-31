{
  pkgs,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = ["/home/luke/Pictures/nixWallpaper.png"];

      wallpaper = [
        "HDMI-A-1,/home/luke/Pictures/nixWallpaper.png"
        "DP-2,/home/luke/Pictures/nixWallpaper.png"
      ];
    };
  };
}
