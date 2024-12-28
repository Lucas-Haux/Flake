{ ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {

      manager = {
        show_hidden = false;
        sort_dir_first = true;
        linemode = "mtime";
        scrolloff = 4;
      };
    };
  };
}
