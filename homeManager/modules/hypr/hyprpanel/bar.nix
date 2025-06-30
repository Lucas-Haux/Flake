{
  layouts = {
    # Main Monitor
    "0" = {
      "left" = [
        "dashboard"
        "cpu"
        "ram"
        "cputemp"
        "network"
        "bluetooth"
      ];
      "middle" = [
        "clock"
        "workspaces"
      ];
      "right" = [
        "volume"
        "media"
        "systray"
        "notifications"
      ];
    };
    # Vertical 2nd Monitor
    "1" = {
      "left" = [ ];
      "middle" = [ "workspaces" ];
      "right" = [ ];
    };
    # Horizontal 3rd Monitor
    "2" = {
      "left" = [ ];
      "middle" = [ "workspaces" ];
      "right" = [ ];
    };
  };

  launcher.autoDetectIcon = true;

  customModules = {
    ram = {
      leftClick = "ghostty --class=com.btop.btop --confirm-close-surface=false -e btop";
      round = true;
    };
    cpu = {
      leftClick = "ghostty --class=com.btop.btop --confirm-close-surface=false -e btop";
    };
  };

  network = {
    label = false;
    showWifiInfo = true;
  };

  bluetooth = {
    label = false;
  };

  workspaces = {
    workspaces = 9;
    monitorSpecific = true;
    ignored = "-\\d+";
    show_numbered = true;
    numbered_active_indicator = "highlight";
  };

  clock.format = "%y/%m/%d  %H:%M";

  volume = {
    rightClick = "pwvucontrol";
  };

  media = {
    show_active_only = true;
    format = "{title}";
  };

  notifications.show_total = false;

  # volume.rightClick = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
  # volume.middleClick = "pavucontrol";
}
