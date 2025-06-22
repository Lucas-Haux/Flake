{ pkgs }:
{
  clock.time.military = false;
  clock.time.hideSeconds = false;
  clock.weather.enabled = false;
  media.displayTime = true;

  dashboard = {
    controls.enabled = true;
    powermenu.avatar = {
      image = "$HOME/Media/pictures/NixOS.ico";
      name = "Luke";
    };
    # broken in home manager
    shortcuts = {
      enabled = false;
      # left = {
      #   shortcut1 = {
      #     icon = "";
      #     command = "ghostty -e ssh 10.0.0.59";
      #   };
      #   shortcut2 = {
      #     icon = "";
      #     command = "hyprpicker -a";
      #   };
      #   shortcut3 = {
      #     icon = "󰚺";
      #     command = "";
      #   };
      #   shortcut4 = {
      #     icon = "󰄛";
      #     command = "";
      #   };
      # };
      # right = {
      #   shortcut1 = {
      #     icon = "󰚺";
      #     command = "";
      #   };
      #   shortcut2 = {
      #     icon = "󰄛";
      #     command = "";
      #   };
      #   shortcut3 = {
      #     icon = "󱩌";
      #     command = "";
      #   };
      #   shortcut4 = {
      #     icon = "";
      #     command = "hyprpanel -t dashboardmenu";
      #   };
      #  shortcut3 = {
      #   icon = "󰹑";
      #   command = "hyprshot -m region -s --clipboard-only -f \"$HOME/Media/screenShots/$(date '+%b-%d-%Y_%H-%M').jpg\"";
      # };
      # shortcut4 = {
      #   icon = "󰑋";
      #   command = "wf-recorder -a -f \"$HOME/Media/screenRecordings/$(date '+%b-%d-%Y_%H-%M').mkv\" -g \"$(slurp -b 18202599 -d)\"";
      # };
      # };
    };

    directories = {
      enabled = true;
      left = {
        directory1 = {
          label = "󰉍 Downloads";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Downloads\"";
        };
        directory2 = {
          label = "󰉏 Images";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Images\"";
        };
        directory3 = {
          label = "󱃪 Projects";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Projects\"";
        };
      };
      right = {
        directory1 = {
          label = "󱧶 Documents";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Documents\"";
        };
        directory2 = {
          label = "󰉏 Videos";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Videos\"";
        };
        directory3 = {
          label = "󰲂 Notes";
          command = "ghostty --class=com.filemanager.filemanager --confirm-close-surface=false -e \"xdg-open $HOME/Notes\"";
        };
      };
    };
  };

  volume.raiseMaximumVolume = true;
}
