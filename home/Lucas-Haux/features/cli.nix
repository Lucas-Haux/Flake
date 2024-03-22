{
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    bottom # System viewer
    ncdu # TUI disk usage
    fd # Better find
    diffsitter # Better diff
    nix-output-monitor # Use nom instead of nix
    zsh
    oh-my-zsh
    thefuck
    nvchad
    alacritty
    git

    ###Stuff that i dont use but might###

    #nil # Nix LSP
    #nixfmt # Nix formatter
    #nvd # Differ
    #nh # Nice wrapper for NixOS and HM
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "agnoster";
    };
  };
}
