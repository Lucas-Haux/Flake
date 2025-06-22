{ config, ... }:
{
  services.clipse = {
    enable = true;
    allowDuplicates = false;
    historySize = 500;
    imageDisplay = {
      type = "kitty";
      scaleY = 15;
      scaleX = 15;
      heightCut = 2;
    };
    systemdTarget = "hyprland-session.target";
    theme = with config.colorscheme.colors; {
      useCustomTheme = true;
      TitleFore = "#${base07}";
      TitleBack = "";
      TitleInfo = "#${base0F}";
      NormalTitle = "#${base08}";
      DimmedTitle = "#${base09}";
      SelectedTitle = "#${base0B}";
      NormalDesc = "#${base0A}";
      DimmedDesc = "#${base09}";
      SelectedDesc = "#${base0B}";
      StatusMsg = "#${base03}";
      PinIndicatorColor = "#${base0E}";
      SelectedBorder = "#${base07}";
      SelectedDescBorder = "#${base07}";
      FilteredMatch = "#${base0B}";
      FilterPrompt = "#${base07}";
      FilterInfo = "#${base0F}";
      FilterText = "#${base04}";
      FilterCursor = "#${base07}";
      HelpKey = "#${base03}";
      HelpDesc = "#${base02}";
      PageActiveDot = "#${base0F}";
      PageInactiveDot = "#${base03}";
      DividerDot = "#${base03}";
      PreviewedText = "#${base04}";
      PreviewBorder = "#${base0F}";
    };
  };
}
