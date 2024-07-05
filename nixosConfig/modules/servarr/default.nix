{ pkgs, config, nixarr, ... }:
{ 
  fileSystems."/data/media" = {
    device = "/dev/media/lvol0";
    fsType = "ext4";
  };
  
  services.radarr = {
    enable = true;
    openFirewall = true; # 7878
    group = "multimedia";
  };
  
  services.sonarr = {
    enable = true;
    openFirewall = true; # 8989
    group = "multimedia";
  };
  
  services.deluge = {
    enable = true;
    openFirewall = true; # 8112
    web = {
      enable = true;
      openFirewall = true;
    };
    group = "multimedia";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true; # 5055
  };
  users.groups.multimedia = {};

  users.users.multimedia = {
    isSystemUser = true;
    group = "multimedia";
    home = "/var/lib/multimedia";
    createHome = true;
  };

  systemd.tmpfiles.rules = [
    "d /data/media 755 multimedia multimedia"
    "d /data/media/library/shows 0755 sonarr multimedia"
    "d /data/media/library/movies 0775 radarr multimedia"
  ];
  services.transmission = {
    enable = true;
    openFirewall = true; 
  };
}
