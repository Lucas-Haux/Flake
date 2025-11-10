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
    };
  services.mpd-mpris.enable = true;
}
