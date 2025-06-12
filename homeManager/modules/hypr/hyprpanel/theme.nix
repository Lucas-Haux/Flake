{
  name = "nord";
  font.size = "14px";

  # Bar
  bar = {
    floating = true;
    transparent = true;
    margin_sides = "0.4em";
    margin_bottom = "0em";
    outer_spacing = "0em";

    buttons = {
      style = "default";
      enableBorders = true;
      borderSize = "0.12em";
      background_opacity = 80;
      background_hover_opacity = 100;
      modules.ram.enableBorder = true;
      spacing = "0.4em";
      radius = "0.95em";
      y_margins = "0em";

      workspaces = {
        numbered_active_highlight_padding = "0.8em";
        numbered_active_highlight_border = "0.5em";
      };
    };
  };
}
