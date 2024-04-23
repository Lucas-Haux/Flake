{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  services = {

    syncthing = {
      enable = true;
      dataDir = "/home/luke";
      configDir = "/home/luke/.config/syncthing";
      user = "luke";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI

      settings = {
        devices = {
          "Home_Server" = {
            id = "MUSJZ3T-YYFJOEI-D4UJV7B-LM37V3L-MJALU4V-3CBSPSN-ZY5YCPV-X3ZJPAP";
            autoAcceptFolders = true;
            intoducer = true; 
          };
          "Pixel_8" = {
            id = "3GX346V-N36HTPO-7FRKTWW-FJMNRH2-3264AHA-Y3QKTCL-YB7W5UR-4VSNNAJ";
            autoAcceptFolders = true;
          };
        };
        folder = {
          "Obsidian" = {
             id = "ccal1-e2j6y";
             devices = [ "Home_Server" "Pixel_8" ]; 
             path = "/home/luke";
             label = "Obsidian";
          };
          "Keepass" = {
             id = "whsrv-jg3cb";
             devices = [ "Home_Server" "Pixel_8" ];
             path = "/home/luke";
             label = "Keepass";
          };
        };
      };
    };

  };
}
