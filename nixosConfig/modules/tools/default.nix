{ pkgs, config, ... }:
{
   environment.systemPackages = [
    pkgs.pciutils
    pkgs.htop
    pkgs.nvtop
    pkgs.neovim
    pkgs.gcc
  ];
}
