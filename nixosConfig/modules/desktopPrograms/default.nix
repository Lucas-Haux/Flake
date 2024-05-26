{
  config,
  pkgs,
  lib,
  ...
}: let
  # Your existing definitions
  # obsidian = pkgs.callPackage ./../../packages/obsidian.nix {};
in {
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
    obsidian
    qbittorrent-qt5
    wgnord
  ];
  services.udev.packages = with pkgs; [
    via
  ];
}
