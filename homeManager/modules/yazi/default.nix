{ lib, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {

      manager = {
        show_hidden = true;
        sort_dir_first = true;
        linemode = "mtime";
        scrolloff = 4;
      };
    };
  };
}
