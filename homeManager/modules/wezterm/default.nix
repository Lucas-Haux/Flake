{ pkgs, config, lib, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = "
      return {
        enable_wayland = false,
	color_scheme = 'Tokyo Night Storm'
      }
    ";
  };
}
