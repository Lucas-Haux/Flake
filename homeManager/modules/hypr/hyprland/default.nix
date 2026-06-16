{
  config,
  lib,
  ...
}:
let
  pointer = config.home.pointerCursor;
in
{
  imports = [
    ./rules.nix
    ./binds.nix
    ./animations.nix
    ./decoration.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {

      exec-once = (import ./execOnce.nix { inherit pointer; });

      env = [
        "WLR_NO_HARDWARE_CURSORS,2"
        "MOZ_ENABLE_WAYLAND=1"
        "EGL_PLATFORM=wayland"
        "OZONE_PLATFORM=wayland"
      ];

      general = {
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 12;
        allow_tearing = false;
        float_gaps = 10;
        snap = {
          enabled = true;
          respect_gaps = true;
        };
        border_size = 2;
        resize_on_border = true;
      };

      dwindle = {
        preserve_split = true;
      };

      master = {
        # new_is_master = true;
      };

      monitor = [
        "DP-1, 1920x1080@144, 1080x400, 1"
        "DP-2, 1920x1080@60, 3000x385, 1"
        "DP-3, 1920x1080@60, 0x0, 1, transform,3"
      ];

      input = {
        kb_layout = "us";
        kb_variant = ",qwerty";
        follow_mouse = 1;
        follow_mouse_threshold = 5;
        sensitivity = -4;
        repeat_delay = 300;
      };

      cursor = {
        no_hardware_cursors = "true"; # fixes vertical monitor cursor being a black square
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc = {
        vrr = 0;
        enable_swallow = true;
        # new_window_takes_over_fullscreen = 2;
        middle_click_paste = 0;
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        # focus_on_activate = true; # makes the auto open mess up
      };
    };
  };
}
