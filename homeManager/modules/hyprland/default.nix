{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./binds.nix
    ./settings.nix
  ];

  home.packages = [
  ];

  # enable hyprland
  wayland.windowManager.hyprland = {

    # plugins = [inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix];

    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
