{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    initExtra = # bash
      ''
        function y() {
        	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        	yazi "$@" --cwd-file="$tmp"
        	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        		builtin cd -- "$cwd"
        	fi
        	rm -f -- "$tmp"
        };

        nixsearch() {
          nix search nixpkgs "$@" 2>/dev/null | sed -E 's/legacyPackages\.[a-z0-9_\-]+\.//'
        }

         export EDITOR="nvim"
      '';
  };
}
