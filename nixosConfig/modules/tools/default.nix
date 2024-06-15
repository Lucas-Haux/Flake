{ pkgs, config, ... }:
{
   environment.systemPackages = [
    pkgs.pciutils
    pkgs.htop
    pkgs.nvtop
  ];
}
