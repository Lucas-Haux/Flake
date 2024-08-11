{ pkgs, config, lib, ... }: {
  services.sabnzbd = with lib; {
    enable = true;
    openFirewall = true;
    group = "multimedia";
    user = "multimedia";
  };
}
