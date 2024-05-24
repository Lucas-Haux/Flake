{ pkgs, config, ... }:
{
   environment.systemPackages = [
    pkgs.pciutils
  ];
}
