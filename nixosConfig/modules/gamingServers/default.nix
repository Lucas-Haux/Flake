{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    papermc
    jdk
  ];
}
