{ pkgs, config, nixarr, ... }:
{ 
  fileSystems."/data/media" = {
    device = "/dev/media/lvol0";
    fsType = "ext4";
  };
  
  services.radarr = {
    enable = true;
    openFirewall = true; # 7878
  };
  
  services.sonarr = {
    enable = true;
    openFirewall = true; # 8989
  };
  
  services.deluge = {
    enable = true;
    openFirewall = true; # 8112
    web = {
      enable = true;
      openFirewall = true;
    };
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true; # 5055
  };
}
