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
    shortcuts = {
      enabled = true;
      right.shortcut1.command = "${pkgs.gcolor3}/bin/gcolor3";
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
