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
      hyprpanel.enable = false;
      rofi.enable = false;
      gtk.enable = true;
    };
  };
}
