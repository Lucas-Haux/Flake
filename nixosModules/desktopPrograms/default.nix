{
  config,
  pkgs, 
  lib,
  ...
}:
with lib; {
  environment.systemPackages = with pkgs; [
    wget
    dolphin
    via
    floorp
    git
    keepassxc
    pavucontrol
    gparted
    gimp
    libreoffice
    kitty
    alacritty
  ];
  services.udev.packages = with pkgs; [
    via
  ]; 
}
