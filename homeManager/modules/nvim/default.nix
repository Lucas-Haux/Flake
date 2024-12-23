{ pkgs, config, ... }:
{
  home.file.".config/nvim" = {
    source = ./lua;
    recursive = true;
    force = true;
  };
}
