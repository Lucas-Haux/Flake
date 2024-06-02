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

      preload = ["/home/luke/Pictures/rustWallpaper.png"];

      wallpaper = [
        "HDMI-A-1,/home/luke/Pictures/rustWallpaper.png"
        "DP-2,/home/luke/Pictures/rustWallpaper.png"
      ];
    };
  };
}
