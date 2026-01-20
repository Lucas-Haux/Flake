{ pkgs, ... }:
{
  programs.command-not-found.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
        "colorize"
        "colored-man-pages"
        "command-not-found"
        "pj"
        "zsh-navigation-tools"
      ];
    };

    initContent = # bash
      ''
        export KEYTIMEOUT=1

        # BROKEN
        # search for packages within the shell
        # nixSearch() {
        #   nix-search "$@" 2>/dev/null | sed -E 's/legacyPackages\.[a-z0-9_\-]+\.//'
        # }

        # Quick Shell
        qs() {
          nix-shell -p "$@" --run zsh
        }

        # For pj(Project Jump) Plugin
        PROJECT_PATHS=(~/Projects/flutter)

        export EDITOR="nvim"
      '';

    shellAliases = {
      ll = "ls -l";
      cd = "z"; # replace cd with zoxide

      # Nixos And Home Manager Switch Aliases
      rebuild = "nh os switch --commit-lock-file -j 2 --cores 4 -H desktop ~/Flake";
      rebuild-server = "nh os switch -u --commit-lock-file -j 2 --cores 4 -H server ~/Flake";
      home = "nh home switch -c luke@desktop ~/Flake";
      home-server = "nh home switch -c luke@server ~/Flake";

      # Quickly Enter My Flutter Dev Shell
      flutter-shell = "export NIXPKGS_ALLOW_UNFREE=1; nix develop --impure ~/Flake/shells/flutter -c zsh";

      # Toggle My Phone Webcam
      webcam-on = "adb -s 19271FDEE00013 shell svc usb setFunctions uvc";
      webcam-off = "adb -s 19271FDEE00013 usb";
    };
  };
}
