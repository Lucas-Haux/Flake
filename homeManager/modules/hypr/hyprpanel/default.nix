{
  config,
  pkgs,
  inputs,
  # astal,
  ...
}:
{
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    # inputs.ags.homeManagerModules.default
  ];
  home.packages = [
    pkgs.libgtop
    pkgs.gtop
    pkgs.btop
    inputs.hyprpanel.packages.${pkgs.system}.wrapper
  ];
  programs.hyprpanel = {
    enable = true;
    overwrite.enable = true;
    hyprland.enable = true;
    systemd.enable = false;
    override = (import ./colorOverride.nix { inherit config; });
    settings = {
      layout = {
        "bar.layouts" =
          let
            main =
              { }:
              {
                "left" = [
                  "dashboard"
                  "cpu"
                  "ram"
                  "cputemp"
                  "network"
                  "bluetooth"
                ];
                "middle" = [
                  "clock"
                  "workspaces"
                ];
                "right" = [
                  "volume"
                  "media"
                  "systray"
                  "notifications"
                ];
              };
            alt =
              { }:
              {
                "left" = [
                  "dashboard"
                  "cpu"
                ];
                "middle" = [
                  "workspaces"
                ];
                "right" = [
                  "ram"
                  "notifications"
                ];
              };
            none = {
              "left" = [ ];
              "middle" = [ ];
              "right" = [ ];
            };
          in
          {
            "0" = main { };
            "1" = alt { };
            "2" = alt { };
            "3" = none;
          };
      };
      scalingPriority = "both";
      # theme = import ./theme.nix;
      bar = import ./bar.nix;
      menus = (import ./menus.nix { inherit pkgs; });
    };
  };
}
