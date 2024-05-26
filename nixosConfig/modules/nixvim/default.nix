{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.base16 = {
      enable = true;
      colorscheme = "tokyo-night-storm";
    };
    plugins.transparent.enable = true;
  };
}

