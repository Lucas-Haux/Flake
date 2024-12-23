{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  home-manager,
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
  };

  home.packages = [
    # pkgs.steam
    inputs.nixvim.packages.x86_64-linux.default
    (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "Hack"
      ];
    })
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Fonts
  fonts.fontconfig.enable = true;

  home.stateVersion = "24.05";
}
