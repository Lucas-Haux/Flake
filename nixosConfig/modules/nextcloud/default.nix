{ pkgs, config, lib, ... }:
{
  # environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    hostName = "cloud.nodeserver.cloud";
    package = pkgs.nextcloud28;
    configureRedis = true;
    database.createLocally = true;
    maxUploadSize = "16G";
    settings = {
      log_type = "file";
      loglevel = 1;
      default_phone_region = "US";
    };

    config = {
      dbtype = "mysql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";

    };
    extraAppsEnable = true;
    autoUpdateApps.enable = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) contacts calendar tasks cookbook memories notes;
    };
  };

  services.mysql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
     { name = "nextcloud";
       ensurePermissions = { "nextcloud.*" = "ALL PRIVILEGES";};

     }
    ];
    package = pkgs.mariadb;
  };

  # ensure that the db is running *before* running the setup
  systemd.services."nextcloud-setup" = {
    requires = ["mysql.service"];
    after = ["mysql.service"];
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
