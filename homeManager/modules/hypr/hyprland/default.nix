{ pkgs, config, lib, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec = [
        "waybar"
      ];
    };
    extraConfig = ''
      # Monitor settings
      monitor=HDMI-A-1, 1920x1080@60, 0x0, 1, transform,1
      monitor=DP-1, 1920x1080@60, 1080x490, 1

      # Some default env vars.
      env = XCURSOR_SIZE,24
      env = GTK_THEME,Nord

      input {
          kb_layout = us
          kb_variant = ,qwerty
          kb_model =

          follow_mouse = 1 # focus window where my mouse is
          sensitivity = 0 

          
      }

      general {
        layout = dwindle
        gaps_in = 4
        gaps_out = 20
        
        # border
        border_size = 3 
        resize_on_border = true
        col.active_border = rgba(${lib.removePrefix "#" config.colorscheme.colors.base0B}ee) # rgba(${lib.removePrefix "#" config.colorscheme.colors.base0B}ee) 45deg
        col.inactive_border = rgba(${lib.removePrefix "#" config.colorscheme.colors.base00}ee)

        allow_tearing = false
      }

      decoration {
          rounding = 10

          blur {
              enabled = true
              size = 3
              passes = 1
          }

          drop_shadow = yes
          shadow_range = 12
          shadow_render_power = 6
          col.shadow = rgba(1a1a1aee)
      }

      animations { # todo
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
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
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
      }

      # Window rules
      # windowrulev2 = float,class:(wezterm),title:(Wezterm)

      # Binds
      $mainMod = SUPER

      bind = $mainMod, C, killactive, 
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, M, exit, 
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, F, fullscreen, 1

      # Exec Binds
      bind = $mainMod, R, exec, rofi -show drun # application starter
      bind = $mainMod SHIFT, P, exec, grimblast --notify --cursor --freeze --wait 2 --scale 1 copy area
      # bind = $mainMod SHIFT, K, exec, keepassxc # password manager
      bind = $mainMod SHIFT, F, exec, floorp # browser
      bind = $mainMod, Q, exec, wezterm # terminal
      # bind = $mainMod SHIFT, O, exec, hyprctl dispatch focuswindow "class:obsidian"
      # bind = $MainMod SHIFT, O, exec, obsidian || hyprctl dispatch focuswindow "class:obsidian"


      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Special workspace
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      windowrulev2 = tile,class:(keepassxc)
      windowrulev2 = workspace special:keepassxc,class:(keepassxc)
      bind = SUPER, K, exec, pgrep keepassxc && hyprctl dispatch togglespecialworkspace keepassxc || keepassxc & 

      windowrulev2 = tile,class:(vesktop)
      windowrulev2 = workspace special:vesktop,class:(vesktop)
      bind = SUPER, D, exec, pgrep electron && hyprctl dispatch togglespecialworkspace vesktop || electron &
       
      windowrulev2 = tile,class:(obsidian)
      windowrulev2 = workspace special:obsidian,class:(obsidian)
      bind = SUPER, O, exec, hyprctl dispatch togglespecialworkspace obsidian

    '';
  };
}
