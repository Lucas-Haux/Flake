{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    htop
    nvtop
    gcc
    neovim # config in home manager
    wget
    wgnord # nordvpn client
  ];
}
