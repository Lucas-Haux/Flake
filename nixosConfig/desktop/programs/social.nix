{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    signal-desktop
    zoom-us
    # cinny-desktop # matrix client
    github-desktop
    # protonmail-desktop
    # hexchat # IRC client
    # jitsi-meet  # Video Conference
    # thunderbird # Email client
    (callPackage ../../../pkgs/androidMessages { })
  ];
}
