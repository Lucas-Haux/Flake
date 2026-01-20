{ pkgs, ... }:
{
  home.sessionVariables.TERMINAL = "ghostty";

  stylix.targets.ghostty.enable = false;

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
      background-opacity = 0.75;
      theme = "Nord";
      background = "#2E3440";
      window-decoration = "client";
      gtk-titlebar = false;
      window-theme = "ghostty";
      gtk-toolbar-style = "raised";
      resize-overlay = "never";
      window-save-state = "always";
      shell-integration-features = [
        "ssh-env"
      ];

      keybind = "ctrl+enter=unbind";
      # see https://github.com/ghostty-org/ghostty/discussions/3501
      # font-family = "Monaspace Neon";
      font-codepoint-map = "U+E000-U+E00A,U+E0A0-U+E0A3,U+E0CA,U+E0CC-U+E0D7,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E6B7,U+E700-U+E8EF,U+EA60-U+EC1E,U+ED00-U+F2FF,U+EE00-U+EE0B,U+F300-U+F381,U+F400-U+F533,U+F0001-U+F1AF0=Symbols Nerd Font";

      # font-family = "MonaspiceNe NFM"
      # font-family-bold = "MonaspiceNe NFM Bold"
      # font-family-bold-italic = "MonaspiceRn NFM Bold Italic"
      # font-family-italic = "MonaspiceRn NFM Italic"
    };
  };
}
