{
  launcher.autoDetectIcon = true;

  customModules.ram.round = true;

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
