{
  config,
  pkgs,
  lib,
  ...
}:
{
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
    portfolio
    tor-browser
    qemu
    quickemu
    pavucontrol # control audio
    pwvucontrol
    gparted # manage drive partions
    gimp # image editor
    libreoffice
    # qbittorrent-qt5
    radeontop # amd gpu utilization
    nixd # nixos language server
  ];
  programs.steam.package = pkgs.steam.override {
    extraLibraries =
      pkgs:
      (
        with config.hardware.opengl;
        if pkgs.hostPlatform.is64bit then [ package ] ++ extraPackages else [ package32 ] ++ extraPackages32
      )
      ++ [ pkgs.libxcrypt ];
  };
  programs.adb.enable = true;
  programs.steam.enable = true;
}
