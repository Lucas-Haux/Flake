{ pkgs, config, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = true;
  };
}
