{ config, pkgs, lib, ... }: with lib; {
  environment.systemPackages = [ pkgs.syncthing ]; #shouldnt be needed but I think it helped with my config saving
  services.syncthing = {
    enable = true;
    options.urAccepted = -1;
  };
}
