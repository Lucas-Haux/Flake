{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    htop
    nvtop
    gcc
    # neovim # config in home manager
    wget
    lazygit
    wgnord # nordvpn client
    jq # json processor
    socat # data transfer
  ];
}
