{ pkgs, config, lib, ... }: {
  fileSystems."/data/media" = {
    device = "/dev/media/lvol0";
    fsType = "ext4";
  };
  
  systemd.tmpfiles.rules = [
    "d /data/media 755 multimedia multimedia"
    "d /data/media/library/shows 0755 sonarr multimedia"
    "d /data/media/library/movies 0775 radarr multimedia"
  ];

  users.groups.multimedia = {};
  users.users.multimedia = {
    isSystemUser = true;
    group = "multimedia";
    home = "/var/lib/multimedia";
    createHome = true;
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "multimedia";
    group = "multimedia";
  };

  services.radarr = {
    enable = true;
    openFirewall = true; # 7878
    group = "multimedia";
    user = "multimedia"; 
  };
  
  services.sonarr = { 
    enable = true;
    openFirewall = true; # 8989
    group = "multimedia";
    user = "multimedia";
  };

  services.deluge = { # torrent download client
    enable = true;
    group = "multimedia";
    openFirewall = true; # 8112
    web = {
      enable = true;
      openFirewall = true;
    };
  };
  
  services.sabnzbd = with lib; { # usenet download client
    enable = true;
    openFirewall = true;
    group = "multimedia";
    user = "multimedia";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true; # 5055
  };
}
