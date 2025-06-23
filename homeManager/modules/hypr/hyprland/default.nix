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
    settings = {

      exec-once = (import ./execOnce.nix { inherit pointer; });

      env = [
        "GTK_THEME,Nordic"
        "WLR_NO_HARDWARE_CURSORS,1"
        "MOZ_ENABLE_WAYLAND=1"
        "EGL_PLATFORM=wayland"
      ];

      general = {
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 10;
        allow_tearing = false;
        snap = {
          enabled = true;
          # respect_gaps = true;
        };
        border_size = 3;
        resize_on_border = true;
        "col.active_border" = "rgba(${lib.removePrefix "#" config.colorscheme.colors.base0B}ee)";
        "col.inactive_border" = "rgba(${lib.removePrefix "#" config.colorscheme.colors.base01}ee)";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        # new_is_master = true;
      };

      monitor = [
        "DP-1, 1920x1080@240, 1080x505, 1"
        "HDMI-A-1, 1920x1080@60, 3000x385, 1"
        "DP-2, 1920x1080@60, 0x0, 1, transform,3"
      ];

      input = {
        kb_layout = "us";
        kb_variant = ",qwerty";
        follow_mouse = 1;
        follow_mouse_threshold = 5;
        sensitivity = -1;
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        vfr = true;
        vrr = 0;
        enable_swallow = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = 0;
      };
    };
  };
}
