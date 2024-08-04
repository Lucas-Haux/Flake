{ pkgs, inputs, config, ...}: {
  imports = [
    ./hyprland
    ./waybar
    ./hyprpaper
  ];
}
