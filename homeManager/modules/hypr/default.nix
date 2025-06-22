{
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    # ./waybar
    ./hyprpaper
    ./hyprlock
    ./hyprpanel
    # ./swaync
    ./clipse
  ];
  home.packages = with pkgs; [
    slurp
    hyprshot
    kooha # for video
    wf-recorder # Screen recorder
    hyprpicker # Color picker
  ];
}
