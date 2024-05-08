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
    };
  };
}
