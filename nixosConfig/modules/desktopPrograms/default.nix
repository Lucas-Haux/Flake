{ config, pkgs, lib, ... }: {
  imports = [
  ./social.nix # social apps like email client and discord
  ];

  environment.systemPackages = with pkgs; [
    jellyfin-media-player
    spacedrive # file manager 
    obsidian # notes 
    keepassxc # password manager
    # floorp
    brave
    pavucontrol # control audio
    gparted # manage drive partions
    gimp  # image editor
    libreoffice
    qbittorrent-qt5
  ];
}
