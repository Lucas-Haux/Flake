{
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    # ./waybar
    # ./hyprpaper
    # ./hyprlock
    # ./hyprpanel
    # ./swaync
    ./quickshell
    # ./clipse
  ];
  home.packages = with pkgs; [
    slurp
    hyprshot
    gpu-screen-recorder
    # kooha # for video
    hyprpicker # Color picker
  ];
}
