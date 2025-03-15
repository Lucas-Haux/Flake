{ ... }:
{
  home.sessionVariables.TERMINAL = "ghostty";
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      background-opacity = 0.70;
      gtk-titlebar = false;
      theme = "nord";
      resize-overlay = "never";
      window-save-state = "always";
      keybind = "ctrl+enter=unbind";
    };
  };
}
