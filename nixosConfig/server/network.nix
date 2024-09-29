{ pkgs, config, ... }: 
{ 
environment.systemPackages = [ pkgs.cloudflared ];

 users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };
  users.groups.cloudflared = { };
  
  
    systemd.services.my_tunnel = {
    wantedBy = [ "multi-user.target" ];
#    after = [ "network.target" ];
    after = [ "network-online.target" "systemd-resolved.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token=eyJhIjoiMjNkODYzNjNmMmFjMzY3NTU5NmI1Zjg2YzQ5MWI2NTAiLCJ0IjoiOTUxMmM4NTUtYjQxZC00ODgzLWFjMTItMTllZTdmZTRlYThjIiwicyI6IlpUZzJNR1ZqT0dNdFkyTmxOaTAwWkRSbExUZzVaVGN0TUdKbU4yTXdOV1pqTVRKbSJ9";
#      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --credentials-file=/home/prateek/cloudflare.token";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };

  networking = {
  nameservers = [ "1.1.1.1" ];
  nftables = {
    enable = true;
    ruleset = ''
        table ip nat {
          chain PREROUTING {
            type nat hook prerouting priority dstnat; policy accept;
            iifname "eno1" tcp dport 64000 dnat to 10.0.0.178:64000
            iifname "eno1" udp dport 64000 dnat to 10.0.0.178:64000
            iifname "eno1" tcp dport 25565 dnat to 10.0.0.178:25565
            iifname "eno1" udp dport 25565 dnat to 10.0.0.178:25565
            iifname "eno1" tcp dport 32400 dnat to 10.0.0.178:32400
          }
        }
    '';
  };
  firewall = {
    enable = true;
    allowedTCPPorts = [ 64000 25565 8080 32400 80 443 ];
    allowedUDPPorts = [ 64000 25565];
  };
  nat = {
    enable = true;
    internalInterfaces = [ "en01" ];
    externalInterface = "en01";
    forwardPorts = [
      {
        sourcePort = 64000;
        proto = "tcp";
        destination = "10.0.0.178:64000";
      }
      {
        sourcePort = 64000;
        proto = "udp";
        destination = "10.0.0.178:64000";
      }
      {
        sourcePort = 25565;
        proto = "tcp";
        destination = "10.0.0.178:25565";
      }
      {
        sourcePort = 25565;
        proto = "udp";
        destination = "10.0.0.178:25565";
      }
      {
        sourcePort = 32400;
        proto = "tcp";
        destination = "10.0.0.178:32400";
      }
    ];
  };
 };
}
