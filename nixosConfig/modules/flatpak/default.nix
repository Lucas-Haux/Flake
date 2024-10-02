{
  pkgs,
  config,
  ...
}: {
  services.flatpak.enable = true;
  services.flatpak.packages = [
    # "io.github.zen_browser.zen"
  ];
}
