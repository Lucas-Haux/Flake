{ pkgs, config, ... }: 
{ 
  environment.systemPackages = with pkgs; [
    cloudflared
  ];
  services.cloudflared = {
    enable = true;
    tunnels."97ce86af-b183-46ae-9825-89946d43b9d1" = {
      credentialsFile = "./cert.pem";
      default = "http_status:404";
    };
  };
}
