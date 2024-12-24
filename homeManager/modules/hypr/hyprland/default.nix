{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./rules.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "waybar"
        "vesktop"
        "telegram-desktop"
        "obsidian"
        "keepassxc"
        "zen"
      ];
      exec = [
        "zen"
      ];
    };
    extraConfig = ''
      # Monitor settings
      monitor=DP-2, 1920x1080@120, 1080x490, 1
      monitor=HDMI-A-1, 1920x1080@60, 3000x450, 1
      monitor=DP-3, 1920x1080@60, 0x0, 1, transform,3

      # Some dPseudoefault env vars.
      env = XCURSOR_SIZE,24
      env = GTK_THEME,Nord

      input {
          kb_layout = us
          kb_variant = ,qwerty
          kb_model =

          follow_mouse = 1 # focus window where my mouse is
          sensitivity = -1

        special_fallthrough = true
      }

      general {
        layout = dwindle
        gaps_in = 4
        gaps_out = 10

        # border
        border_size = 3
        resize_on_border = true
        col.active_border = rgba(${lib.removePrefix "#" config.colorscheme.colors.base0B}ee) # rgba(${lib.removePrefix "#" config.colorscheme.colors.base0B}ee) 45deg
        col.inactive_border = rgba(${lib.removePrefix "#" config.colorscheme.colors.base00}ee)

        allow_tearing = false
      }

      decoration {
          rounding = 15

          blur {
            enabled = true
            xray = true
            special = false
            new_optimizations = true
            size = 3
            passes = 1
            brightness = 1
            noise = 0.01
            contrast = 1
            popups = true
            popups_ignorealpha = 0.6
          }

          # Shadow
          drop_shadow = yes
          shadow_ignore_window = true
          shadow_range = 20
          shadow_offset = 0 2
          shadow_render_power = 4
          col.shadow = rgba(0000002A)
      }

      animations { # todo
        enabled = true
        # Animation curves

        bezier = linear, 0, 0, 1, 1
        bezier = md3_standard, 0.2, 0, 0, 1
        bezier = md3_decel, 0.05, 0.7, 0.1, 1
        bezier = md3_accel, 0.3, 0, 0.8, 0.15
        bezier = overshot, 0.05, 0.9, 0.1, 1.1
        bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
        bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
        bezier = menu_decel, 0.1, 1, 0, 1
        bezier = menu_accel, 0.38, 0.04, 1, 0.07
        bezier = easeInOutCirc, 0.85, 0, 0.15, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutExpo, 0.16, 1, 0.3, 1
        bezier = softAcDecel, 0.26, 0.26, 0.15, 1
        bezier = md2, 0.4, 0, 0.2, 1 # use with .2s duration
        # Animation configs
        animation = windows, 1, 3, md3_decel, popin 60%
        animation = windowsIn, 1, 3, md3_decel, popin 60%
        animation = windowsOut, 1, 3, md3_accel, popin 60%
        animation = border, 1, 10, default
        animation = fade, 1, 3, md3_decel
        # animation = layers, 1, 2, md3_decel, slide
        animation = layersIn, 1, 3, menu_decel, slide
        animation = layersOut, 1, 1.6, menu_accel
        animation = fadeLayersIn, 1, 2, menu_decel
        animation = fadeLayersOut, 1, 4.5, menu_accel
        animation = workspaces, 1, 7, menu_decel, slide
        # animation = workspaces, 1, 2.5, softAcDecel, slide
        # animation = workspaces, 1, 7, menu_decel, slidefade 15%
        # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
        animation = specialWorkspace, 1, 3, md3_decel, slidevert
      }

      dwindle { # todo
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          # new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      misc {
        vfr = 1
        vrr = 1
        enable_swallow = true
      }
    '';
  };
}
