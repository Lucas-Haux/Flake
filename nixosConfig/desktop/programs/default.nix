{
  config,
  pkgs,
  inputs,
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
    davinci-resolve
    proton-pass
    # jellyfin-media-player
    plex-desktop
    nautilus # file manager
    spacedrive # file manager
    obsidian # notes
    keepassxc # password manager
    brave
    portfolio
    tor-browser
    chromium
    qemu
    quickemu
    # pavucontrol # control audio
    pwvucontrol
    gparted # manage drive partions
    gimp # image editor
    xterm # for ssh support in ghostty
    libreoffice
    qbittorrent-enhanced
    protonvpn-gui
    radeontop # amd gpu utilization
    ente-auth
    zoom-us
    obs-studio
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
  programs = {
    # command-not-found.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    xfconf.enable = true;
  };
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  programs.adb.enable = true;
  programs.steam.enable = true;
  programs.wshowkeys.enable = true;
}
