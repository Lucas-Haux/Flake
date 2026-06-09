{ inputs, pkgs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./scheme.nix
    ./launcher.nix
    ./bind.nix
  ];
  home.packages = [
    pkgs.gpu-screen-recorder
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.caelestia = {
    enable = true;
    # systemd = {
    #   enable = true;
    #   target = "graphical-session.target";
    #   environment = [ ];
    # };
    settings = {
      general = {
        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [
            {
              timeout = 560;
              idleAction = "lock";
            }
            {
              timeout = 720;
              idleAction = "dpms off";
              returnAction = "dpms on";
            }
            {
              timeout = 1190;
              idleAction = [
                "systemctl"
                "suspend-then-hibernate"
              ];
            }
          ];
        };
        apps = {
          terminal = [ "ghostty" ];
          audio = [ "pwvucontrol" ];
          playback = [ "" ];
          explorer = [ "nautilus" ];
        };
      };
      background = {
        desktopClock = {
          enabled = true;
          shadow = {
            enabled = true;
            opacity = 0.7;
            blur = 0.5;
          };
          position = "top-right";
        };
        visualiser = {
          enabled = true;
          blur = true;
        };
      };

      appearance = {
        transparency = {
          enabled = true;
          base = 0.55;
          layers = 0.4;
        };
      };
      border.rounding = 30.5;
      osd = {
        enableBrightness = false;
        enableMicrophone = true;
      };
      paths.sessionGif = "";
      services = {
        useFahrenheit = false;
        weatherLocation = "47.0449,-122.9017";
        useTwelveHourClock = true;
        smartScheme = true;
      };
      dashboard = {
        enabled = true;
        dragThreshold = 25;
        # mediaUpdateInterval = 10000;
        resourceUpdateInterval = 250;
      };
      bar = {
        clock = {
          showDate = true;
          background = true;
          showIcon = false;
        };
        workspaces = {
          showWindows = true;
          activeLabel = "";
          occupiedLabel = "";
          shown = 3;
          occupiedBg = true;
        };
        status = {
          showBattery = false;
          showAudio = true;
        };
        tray = {
          background = true;
          recolour = true;
        };
        entries = [
          {
            id = "logo";
            enabled = false;
          }
          {
            id = "workspaces";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "activeWindow";
            enabled = false;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }

          {
            id = "idleInhibitor";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ];
      };
      lock = {
        hideNotifs = true;
        recolourLogo = true;
      };
      paths.wallpaperDir = "~/Media/Pictures";
    };
    cli = {
      enable = true;
      settings = {
        gtk.enabled = false;
      };
    };
  };

  # xdg.configFile."caelestia/monitors/HDMI-A-1/shell.json".text = # json
  #   ''
  #     {
  #       "background": {
  #         "desktopClock": {
  #             "background": {
  #                 "enabled": false
  #             },
  #             "enabled": false,
  #             "position": "top-right"
  #         }
  #       }
  #     }
  #   '';

  wayland.windowManager.hyprland.settings.exec-once = [
    # "uwsm app -- caelestia resizer -d"
    # "uwsm app -- caelestia shell -d"
    "caelestia scheme set -n onedark"
    "caelestia scheme set -n custom"
  ];
}
