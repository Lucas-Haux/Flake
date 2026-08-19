{
  lib,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    polarity = "dark";

    targets = {
      hyprlock.enable = false;
      nixcord.enable = true;
      rofi.enable = false;
      gtk.enable = true;
      zen-browser.profileNames = [ "default" ];
    };
  };
}
