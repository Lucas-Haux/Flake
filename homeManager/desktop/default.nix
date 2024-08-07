{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../modules/hypr
    ./../modules/rofi
    ./../modules/wezterm
    ./../modules/starship
    ./../modules/zsh
    ./../modules/nvim
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

  home.packages = with pkgs; [steam];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
