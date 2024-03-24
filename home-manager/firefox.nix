{ options, config, lib, pkgs, ... }:

{
  config = {
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://kagi.com/";
            "browser.search.defaultenginename" = "Kagi";
            "browser.search.order.1" = "Kagi";
          };
          search = {
            force = true;
            default = "Searx";
            order = [ "Searx" ];
            engines = {
         "Kagi" = {
                urls = [{ template = "https://kagi.com/search?q={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@kagi" ];
              };
              "Bing".metaData.hidden = true;
            };
          };
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
          ];
        };
      };
    };
  };
}



