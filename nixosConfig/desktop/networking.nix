{ config, ... }:
{
  config.networking = {
    networkmanager.enable = true;
    firewall =
      let
        ports = [
          2002 # rQuickShare
        ];
      in
      {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
  };
}
