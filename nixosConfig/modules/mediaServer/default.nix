{ pkgs, config, nixarr, ... }:
{ 
  fileSystems."/data/media" = {
    device = "/dev/media/lvol0";
    fsType = "ext4";
  };

  nixarr = {
    enable = true;
    jellyfin = {
      enable = true;
      expose.https = {
        enable = true;
        acmeMail = "namecheap.nly1p@aleeas.com";
        domainName = "nodeserver.cloud";
      };
    };
  };
}
