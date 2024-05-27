{ pkgs, config, lib, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = "
      return {
        enable_wayland = false,
	color_scheme = 'nord',
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.7
      }
    ";
  };
}
