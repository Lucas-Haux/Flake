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
    yazi
    vscode
    neovim
    jellyfin-media-player
    zed-editor
    imagemagick_light
    wget
    dolphin
    via
    # floorp
    brave
    git
    pavucontrol
    gparted
    gimp
    libreoffice
    kitty
    alacritty
    qbittorrent-qt5
    wgnord
  ];
  services.udev.packages = with pkgs; [
    via
  ];
  services.syncthing.enable = true;
}
