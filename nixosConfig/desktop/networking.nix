{ config, ... }:
{
  config.networking = {
    firewall =
      let
        ports = [
          # rQuickShare
          49999
        ];
      in
      {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
  };
}
