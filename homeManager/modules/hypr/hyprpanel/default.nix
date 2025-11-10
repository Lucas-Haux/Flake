{
  pkgs,
  ...
}:
{
  stylix.targets.hyprpanel.enable = false;
  # idk if i need this
  home.packages = [
    pkgs.libgtop
    pkgs.gtop
    # inputs.hyprpanel.packages.${pkgs.system}.default
  ];
  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    settings = {
      scalingPriority = "both";
      bar = import ./bar.nix;
      menus = (import ./menus.nix { inherit pkgs; });
      theme = import ./theme.nix;
    };
  };
}
