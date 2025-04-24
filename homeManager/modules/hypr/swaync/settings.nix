{
  schema = "/etc/xdg/swaync/configSchema.json";
  positionX = "right";
  positionY = "top";
  layer = "overlay";
  control-center-layer = "top";
  layer-shell = true;
  cssPriority = "application";
  timeout = 12;
  timeout-low = 6;
  timeout-critical = 1;
  fit-to-screen = true;
  keyboard-shortcuts = true;
  image-visibility = "when available";
  transition-time = 200;
  hide-on-clear = false;
  hide-on-action = true;
  script-fail-notify = true;
  # Control Center
  control-center-width = 350;
  control-center-margin-top = 10;
  control-center-margin-bottom = 18;
  control-center-margin-right = 4;
  control-center-margin-left = 4;
  # notification
  notification-2fa-action = true;
  notification-inline-replies = true;
  notification-window-width = 350;
  notification-icon-size = 60;
  notification-body-image-height = 180;
  notification-body-image-width = 180;
  # Define the order and inclusion of widgets in the control center
  widgets = [
    "mpris"
    "title"
    "notifications"
    "volume"
    "buttons-grid"
  ];
  widget-config = {
    title = {
      text = "Notifications:";
      clear-all-button = true;
      button-text = "󰆴";
    };
    # Configuration for the MPRIS media player widget
    mpris = {
      image-size = 80;
      image-radius = 0;
    };
    volume = {
      label = "󰕾 ";
    };
    buttons-grid = {
      actions = [
        {
          label = "";
          command = "ghostty -e ssh 10.0.0.59";
          type = "toggle";
        }
        # Do not Distrub
        {
          label = "󰤄";
          command = "swaync-client -d";
          type = "toggle";
        }
        {
          label = "󰌿";
          command = "hyprlock";
        }
        {
          label = "";
          command = "reboot";
        }
        {
          label = "";
          command = "shutdown now";
        }
      ];
    };
  };
}
