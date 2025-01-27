{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
        "colorize"
        "colored-man-pages"
        "pj"
      ];
    };

    initExtra = # bash
      ''
        export KEYTIMEOUT=1

        function y() {
        	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        	yazi "$@" --cwd-file="$tmp"
        	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        		builtin cd -- "$cwd"
        	fi
        	rm -f -- "$tmp"
        };

        nixsearch() {
          nix search "$@" 2>/dev/null | sed -E 's/legacyPackages\.[a-z0-9_\-]+\.//'
        }

        # for pj plugin
        PROJECT_PATHS=(~/Projects/flutter)

        export EDITOR="nvim"
      '';

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/Flake#desktop";
      home = "home-manager switch --flake ~/Flake/.#luke@desktop";
      flutter-shell = "export NIXPKGS_ALLOW_UNFREE=1; nix develop --impure ~/Flake/shells/flutter -c zsh";
      webcamOn = "adb -s 19271FDEE00013 shell svc usb setFunctions uvc";
      webcamOff = "adb -s 19271FDEE00013 usb";
    };

  };
}
