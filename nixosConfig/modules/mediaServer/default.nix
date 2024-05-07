{ pkgs, config, nixarr, ... }:
{ 
  nixarr = {
    enable = true;
    jellyfin = {
      enable = true;
    };
  };
}
