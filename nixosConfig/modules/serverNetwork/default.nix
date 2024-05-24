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
}
