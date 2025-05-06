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
    username = "luke";
    homeDirectory = "/home/luke";
    packages = [
      # pkgs.steam
      pkgs.jq
      pkgs.socat
      pkgs.dconf
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

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
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

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Solid";
    };
  };

  xdg.configFile = {
    "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Utterly-Nord-Solid.kvconfig".source =
      "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Utterly-Nord-Solid.kvconfig";
    "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Utterly-Nord-Solid.svg".source =
      "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Utterly-Nord-Solid.svg";
    "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Nord.patchconfig".source =
      "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Nord.patchconfig";
    "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=Utterly-Nord-Solid";
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

  home.stateVersion = "24.11";
}
