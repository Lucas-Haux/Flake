{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    pciutils
    htop
    # nvtop
    gcc
    # neovim # config in home manager
    wget
    lazygit
    icu
    wgnord # nordvpn client
    jq # json processor
    socat # data transfer
  ];
}
