{
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    ./waybar
    ./hyprpaper
    ./hyprlock
    ./swaync
    ./clipse
  ];
  home.packages = with pkgs; [
    grimblast # Screenshots
    kooha # for video
    wf-recorder # Screen recorder
    hyprpicker # Color picker
  ];
}
