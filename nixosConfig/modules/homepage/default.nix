{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.homepage-dashboard
    pkgs.nvidia_smi_exporter
  ];
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = true;
  };
}

