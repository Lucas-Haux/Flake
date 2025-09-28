{ pkgs, ... }:
{
  home.sessionVariables.TERMINAL = "ghostty";

  programs.ghostty = {
    package = pkgs.ghostty.overrideAttrs (_oldAttrs: {
      patchPhase = ''
        find . -name "*.zig" -exec sh -c 'echo "Patching: $1"; sed -i "s/^const xev = @import(\"xev\");$/const xev = @import(\"xev\").Epoll;/" "$1"' _ {} \;
      '';
    });
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      window-padding-y = 4;
      window-padding-x = 4;
      window-padding-balance = true;
      background-opacity = 0.70;
      theme = "Nord";
      window-decoration = "client";
      gtk-titlebar = false;
      window-theme = "ghostty";
      gtk-toolbar-style = "raised";
      resize-overlay = "never";
      window-save-state = "always";
      keybind = "ctrl+enter=unbind";
    };
  };
}
