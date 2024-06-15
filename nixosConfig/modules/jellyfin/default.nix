{ pkgs, lib, ...}:
{
  fileSystems."/data/media" = {
    device = "/dev/media/lvol0";
    fsType = "ext4";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user="luke";
  };
}
