{
  inputs,
  pkgs,
  lib,
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
    # ./../modules/zen_browser
    # ./../modules/nvim
    inputs.nix-colors.homeManagerModules.default

  ];
  colorScheme = inputs.nix-colors.colorSchemes.nord;

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
      # pkgs.steam
      pkgs.jq
      pkgs.socat
      # inputs.zen-browser.packages.x86_64-linux.default
      inputs.nixvim.packages.x86_64-linux.default
    ];
    pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
  };

  programs = {
    git.enable = true;
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Fonts
  # fonts.packages =
  #   [ ]
  #   ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  fonts.fontconfig.enable = true;
}
