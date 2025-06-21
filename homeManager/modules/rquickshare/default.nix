{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.programs.rquickshare.enable = true;

  config = {
    home.packages = [ pkgs.rquickshare ];
    home.file.".local/share/dev.mandre.rquickshare/.settings.json" = {
      enable = true;
      text = ''
        {
          "realclose": false,
          "autostart": true,
          "startminimized":false,
          "download_path": "/home/luke/Downloads/QuickShare",
          "visibility": 1,
          "port": 49999 
        }
      '';
      force = true;
    };
  };
}
