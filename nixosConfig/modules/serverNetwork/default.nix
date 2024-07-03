{ pkgs, config, ... }: 
{ 
  environment.systemPackages = with pkgs; [
    cloudflared
  ];
  systemd.user.services.cloudflaredtunnel = {
    description = "...";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      ${pkgs.cloudflared}/bin/cloudflared tunnel run first 
    '';
    wantedBy = [ "basic.target" ]; # starts after login
  };
  networking = {
  interfaces.eno1 = {
    ipv6.addresses = [{
      address = "2601:603:4c7e:3e40:82a2:6bdb:9c54:6db0";
      prefixLength = 64;
    }];
    ipv4.addresses = [{
      address = "10.0.0.178";
      prefixLength = 24;
    }];
  };
  defaultGateway = {
    address = "10.0.0.1";
    interface = "eno1";
  };
  defaultGateway6 = {
    address = "fe80::1";
    interface = "eno1";
  };
#
#   nftables = {
#     enable = true;
#     ruleset = ''
#         table ip nat {
#           chain PREROUTING {
#             type nat hook prerouting priority dstnat; policy accept;
#             iifname "eno1" tcp dport 65534 dnat to 10.0.0.178:65534
#           }
#         }
#     '';
#   };
#   firewall = {
#     enable = true;
#     allowedTCPPorts = [ 65534 ];
#   };
#   nat = {
#     enable = true;
#     internalInterfaces = [ "en01" ];
#     externalInterface = "wg0";
#     forwardPorts = [
#       {
#         sourcePort = 65534;
#         proto = "tcp";
#         destination = "10.0.0.178:65534";
#       }
#     ];
#   };
 };
}
