{ pkgs, config, lib, ... }: {
  home.sessionVariables.TERMINAL = "wezterm";
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        enable_wayland = false,

        color_scheme = 'nordfox',
        window_background_opacity = 0.7,

        hide_tab_bar_if_only_one_tab = true,
        use_fancy_tab_bar            = false,

        audible_bell = disabled,
        window_padding = {
          left = 3, right = 3,
          top = 3, bottom = 3,
        },
        allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
        adjust_window_size_when_changing_font_size = false,
      }
    '';
  };
}
