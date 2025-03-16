{ ... }:
{
  home.sessionVariables.TERMINAL = "ghostty";
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      window-padding-y = 4;
      window-padding-x = 4;
      window-padding-balance = true;
      background-opacity = 0.70;
      theme = "nord";

      gtk-titlebar = false;
      resize-overlay = "never";
      window-save-state = "always";
      keybind = "ctrl+enter=unbind";
    };
  };
}
