{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./social.nix # social apps like email client and discord
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
    fastfetch
    jellyfin-media-player
    plex-media-player
    spacedrive # file manager
    obsidian # notes
    keepassxc # password manager
    # floorp
    brave
    tor-browser
    pavucontrol # control audio
    pwvucontrol
    gparted # manage drive partions
    gimp # image editor
    libreoffice
    qbittorrent-qt5
  ];
  programs.adb.enable = true;
}
