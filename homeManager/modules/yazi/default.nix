{ pkgs, inputs, ... }:
{
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
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "F" ];
          run = "plugin smart-filter";
        }
        {
          on = "M";
          run = "plugin mount";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }

        # Number Motions
        {
          on = [ "1" ];
          run = "plugin relative-motions 1";
          desc = "Move in relative steps";
        }
        {
          on = [ "2" ];
          run = "plugin relative-motions 2";
          desc = "Move in relative steps";
        }
        {
          on = [ "3" ];
          run = "plugin relative-motions 3";
          desc = "Move in relative steps";
        }
        {
          on = [ "4" ];
          run = "plugin relative-motions 4";
          desc = "Move in relative steps";
        }
        {
          on = [ "5" ];
          run = "plugin relative-motions 5";
          desc = "Move in relative steps";
        }
        {
          on = [ "6" ];
          run = "plugin relative-motions 6";
          desc = "Move in relative steps";
        }
        {
          on = [ "7" ];
          run = "plugin relative-motions 7";
          desc = "Move in relative steps";
        }
        {
          on = [ "8" ];
          run = "plugin relative-motions 8";
          desc = "Move in relative steps";
        }
        {
          on = [ "9" ];
          run = "plugin relative-motions 9";
          desc = "Move in relative steps";
        }
      ];
    };
    plugins = with pkgs.yaziPlugins; {
      starship = starship;
      sudo = sudo;
      smart-filter = smart-filter;
      relative-motions = relative-motions;
      inherit nord yatline;
      mount = mount;
      full-border = full-border;
      chmod = chmod;
    };

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
        require("yatline"):setup({
          theme = require("nord"):setup(),
        })
        require("full-border"):setup {
        	type = ui.Border.ROUNDED
        }
      '';
  };

}
