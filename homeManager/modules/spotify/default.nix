{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        beautifulLyrics
        queueTime
        fullAppDisplay
        hidePodcasts
        shuffle # shuffle+
      ];
      enabledCustomApps = with spicePkgs.apps; [
        # ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
      ];

      theme = spicePkgs.themes.comfy;
      colorScheme = "custom";

      customColorScheme = {
        text = "${config.colorScheme.colors.base0E}";
        subtext = "${config.colorScheme.colors.base05}";
        sidebar-text = "${config.colorScheme.colors.base06}";
        main = "${config.colorScheme.colors.base00}80";
        sidebar = "${config.colorScheme.colors.base02}";
        player = "${config.colorScheme.colors.base00}";
        card = "${config.colorScheme.colors.base00}";
        shadow = "${config.colorScheme.colors.base01}";
        selected-row = "${config.colorScheme.colors.base04}";
        button = "${config.colorScheme.colors.base0F}";
        button-active = "${config.colorScheme.colors.base0F}";
        button-disabled = "${config.colorScheme.colors.base03}";
        tab-active = "${config.colorScheme.colors.base0F}";
        notification = "${config.colorScheme.colors.base0B}";
        notification-error = "${config.colorScheme.colors.base08}";
        misc = "${config.colorScheme.colors.base06}";
      };
    };
  services.mpd-mpris.enable = true;
}
