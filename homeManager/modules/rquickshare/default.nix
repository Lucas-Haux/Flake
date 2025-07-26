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
      force = true;
      text = ''
        {
          "realclose": true,
          "autostart": false,
          "startminimized":false,
          "download_path": "/home/luke/Downloads/QuickShare",
          "visibility": 0,
          "port": 2002 
        }
      '';
    };
  };
}
