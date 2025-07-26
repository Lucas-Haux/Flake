{ config, ... }:
{
  config.networking = {
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
