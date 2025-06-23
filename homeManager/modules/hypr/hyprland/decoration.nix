{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 15;
    rounding_power = 4;

    blur = {
      enabled = true;
      xray = false;
      special = false;
      new_optimizations = true;
      size = 3;
      passes = 2;
      brightness = 1;
      noise = 0.01;
      contrast = 1;
      popups = false;
      popups_ignorealpha = 0.6;
    };

    shadow = {
      enabled = true;
      ignore_window = true;
      range = 20;
      offset = "0 2";
      render_power = 4;
      color = "rgba(0000002A)";
    };
  };
}
