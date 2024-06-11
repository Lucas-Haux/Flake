{ pkgs, config, ... }: 
{
home.file.".config/nvim" = {
  source = ./starter;
  recursive = true;
  force = true;
};
}
