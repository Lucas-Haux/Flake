{
  inputs,
  pkgs,
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
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.nixvim.packages.x86_64-linux.default
      (pkgs.nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "Hack"
        ];
      })
    ];
    pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.nordzy-cursor-theme;
      name = "nordzy-cursor-theme";
      size = 16;
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.nordic;
      name = "nordic";
    };
  };

  programs = {
    git.enable = true;
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Fonts
  fonts.fontconfig.enable = true;

  home.stateVersion = "24.11";
}
