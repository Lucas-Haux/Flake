{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./keymaps.nix
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        show_hidden = false;
        sort_dir_first = true;
        linemode = "mtime";
        scrolloff = 6;

        preview = {
          tab_size = 4;
          image_filter = "lanczos3";
          max_width = 1920;
          max_height = 1080;
          image_quality = 100;
        };
      };
    };

    plugins =
      let
        pluginsRepo = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "plugins";
          rev = "8f1d9711bcd0e48af1fcb4153c16d24da76e732d";
          hash = "sha256-7vsqHvdNimH/YVWegfAo7DfJ+InDr3a1aNU0f+gjcdw=";
        };
      in
      {
        diff = "${pluginsRepo}/diff.yazi";
        full-border = "${pluginsRepo}/full-border.yazi";
        smart-enter = "${pluginsRepo}/smart-enter.yazi";
        smart-paste = "${pluginsRepo}/smart-paste.yazi";
        sudo = "${pluginsRepo}/sudo.yazi";
        smart-filter = "${pluginsRepo}/smart-filter.yazi";
        relative-motions = pkgs.yaziPlugins.relative-motions;
        mount = "${pluginsRepo}/mount.yazi";
        chmod = "${pluginsRepo}/chmod.yazi";

        system-clipboard = pkgs.fetchFromGitHub {
          owner = "orhnk";
          repo = "system-clipboard.yazi";
          rev = "888026c6d5988bd9dc5be51f7f96787bb8cadc4b";
          hash = "sha256-8YtYYxNDfQBTyMxn6Q7/BCiTiscpiZFXRuX0riMlRWQ=";
        };
      }
      // lib.optionalAttrs config.programs.git.enable { git = "${pluginsRepo}/git.yazi"; }
      // lib.optionalAttrs config.programs.starship.enable {
        starship = pkgs.fetchFromGitHub {
          owner = "Rolv-Apneseth";
          repo = "starship.yazi";
          rev = "a63550b2f91f0553cc545fd8081a03810bc41bc0";
          hash = "sha256-PYeR6fiWDbUMpJbTFSkM57FzmCbsB4W4IXXe25wLncg=";
        };
      };

    # plugins = with pkgs.yaziPlugins; {
    #   starship = starship;
    #   sudo = sudo;
    #   smart-filter = smart-filter;
    #   relative-motions = relative-motions;
    #   inherit nord yatline;
    #   mount = mount;
    #   full-border = full-border;
    #   chmod = chmod;
    # };

    flavors = { inherit (pkgs.yaziPlugins) nord; };

    theme = {
      flavor = {
        light = "nord";
        dark = "nord";
      };
      icon = import ./icons.nix;
    };

    initLua = # lua
      ''
        require("starship"):setup()
        require("relative-motions"):setup({ show_numbers="relative", show_motion = true })
        -- require("yatline"):setup({
        --   theme = require("nord"):setup(),
        -- })
        require("full-border"):setup {
        	type = ui.Border.ROUNDED
        }
      '';
  };

}
