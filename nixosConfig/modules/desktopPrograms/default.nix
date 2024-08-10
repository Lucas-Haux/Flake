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
    telegram-desktop
    discord
    vesktop
    jellyfin-media-player
    dolphin
    via
    # floorp
    brave
    pavucontrol
    gparted
    gimp
    libreoffice
    qbittorrent-qt5
  ];
  services.udev.packages = with pkgs; [
    via
  ];
  services.syncthing.enable = true;
}
