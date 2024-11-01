{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pciutils
    htop
    nvtop
    gcc
    neovim # config in home manager
    wget
    git
    wgnord # nordvpn client
  ];
}
