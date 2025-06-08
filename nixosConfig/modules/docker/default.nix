{ config, ... }:
{

  virtualisation.docker = {
    enable = true;
  };

  docker-containers."nginx-proxy-manager" = {
    image = "jc21/nginx-proxy-manager:latest";
    volumes = [
      "/home/hua/.docker/nginx-proxy-manager/data:/data"
      "/home/hua/.docker/nginx-proxy-manager/letsencrypt:/etc/letsencrypt"
    ];
    ports = [
      "80:80"
      "443:443"
      "81:81"
    ];
    extraOptions = [ "--network=bridge" ];
  };

}
