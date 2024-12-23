{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    signal-desktop
    discord
    vesktop # better discord
    element-desktop-wayland # matrix client
    # cinny-desktop # matrix client
    github-desktop
    protonmail-desktop
    hexchat # IRC client
    # jitsi-meet  # Video Conference
    thunderbird # Email client
  ];
}
