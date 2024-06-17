{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  services.syncthing = {
    enable = true;
    systemService = true;
    dataDir = "/home/luke";
    configDir = "/home/luke/.config/syncthing";
    user = "luke";
    options.urAccepted = -1;

  };
}
