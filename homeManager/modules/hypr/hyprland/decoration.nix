{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 15;
    rounding_power = 15;
    # dim_special = 0.1; causes bug with opactiy and multiple specdials
    dim_special = 0.1;

    blur = {
      enabled = true;
      xray = false;
      special = false;
      new_optimizations = true;
      size = 4;
      passes = 2;
      brightness = 0.75;
      contrast = 1.1;
      # noise = 0.01;
    };

    shadow = {
      enabled = true;
      ignore_window = true;
      range = 20;
      offset = "0 2";
      render_power = 3;
    };
  };
}
