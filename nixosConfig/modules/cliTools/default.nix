{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    htop
    nvtop
    gcc
    neovim # config in home manager
    yazi # file browser
    wget
    git
    wgnord # nordvpn client
  ];
}
