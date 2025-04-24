{
  config,
  pkgs,
  ...
}:
{

  programs.waybar = {
    enable = true;
    settings = (import ./settings.nix { inherit config; });
    style = import ./style.nix;
  };

  home.packages = [
    pkgs.networkmanagerapplet
    pkgs.waybar-mpris
    pkgs.pavucontrol
  ];
}
