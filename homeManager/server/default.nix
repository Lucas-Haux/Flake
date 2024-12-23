{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
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

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
