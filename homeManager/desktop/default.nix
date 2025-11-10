{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./../modules/hypr
    ./../modules/rofi
    ./../modules/wezterm
    ./../modules/starship
    ./../modules/zsh
    ./../modules/yazi
    ./../modules/git
    ./../modules/ghostty
    ./../modules/spotify
    ./../modules/nixcord
    ./../modules/rquickshare
    ./../modules/zoxide
    ./../modules/btop
    # ./../modules/stylix
    ./../modules/zenBrowser

  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "24.11";
    username = "luke";
    homeDirectory = "/home/luke";
    packages = [
      pkgs.jq
      pkgs.socat
      inputs.nixvim.packages.x86_64-linux.default
    ];
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    polarity = "dark";
    targets = {
      zen-browser.profileNames = [ "default" ];
      zen-browser.enable = false;
      firefox.enable = false;
      spicetify.enable = false;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  xdg.userDirs = {
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    videos = "${config.home.homeDirectory}/Media/Videos";
  };

  programs = {
    git.enable = true;
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Fonts
  # fonts.packages =
  #   [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  fonts.fontconfig.enable = true;
}
