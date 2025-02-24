{ pkgs, config, ... }:
{
  networking = {
    nameservers = [ "1.1.1.1" ];
    nftables = {
      enable = true;
      ruleset = ''
        table ip nat {
          chain PREROUTING {
            type nat hook prerouting priority dstnat; policy accept;
            iifname "enp5s0" tcp dport 64000 dnat to 10.0.0.59:64000
            iifname "enp5s0" udp dport 64000 dnat to 10.0.0.59:64000
            iifname "enp5s0" tcp dport 25565 dnat to 10.0.0.59:25565
            iifname "enp5s0" udp dport 25565 dnat to 10.0.0.59:25565
            iifname "enp5s0" tcp dport 32400 dnat to 10.0.0.59:32400
          }
        }
      '';
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        64000
        25565
        8080
        32400
        80
	      22
        443
        3000
        9001
      ];
      allowedUDPPorts = [
        64000
        25565
      ];
    };
    nat = {
      enable = true;
      internalInterfaces = [ "enp5s0" ];
      externalInterface = "enp5s0";
      forwardPorts = [
        {
          sourcePort = 64000;
          proto = "tcp";
          destination = "10.0.0.59:64000";
        }
        {
          sourcePort = 9001;
          proto = "tcp";
          destination = "10.0.0.59:9001";
        }
        {
          sourcePort = 3000;
          proto = "tcp";
          destination = "10.0.0.59:3000";
        }
        {
          sourcePort = 64000;
          proto = "udp";
          destination = "10.0.0.59:64000";
        }
        {
          sourcePort = 25565;
          proto = "tcp";
          destination = "10.0.0.59:25565";
        }
        {
          sourcePort = 25565;
          proto = "udp";
          destination = "10.0.0.59:25565";
        }
        {
          sourcePort = 32400;
          proto = "tcp";
          destination = "10.0.0.59:32400";
        }
      ];
    };
  };
}
