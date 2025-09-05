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
    plex-desktop
    nautilus # file manager
    spacedrive # file manager
    obsidian # notes
    keepassxc # password manager
    # floorp
    inputs.zen-browser.packages.${pkgs.system}.default
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
    # qbittorrent-qt5
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
  programs.adb.enable = true;
  programs.steam.enable = true;
}
