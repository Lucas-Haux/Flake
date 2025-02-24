{
  pkgs,
  lib,
  ...
}:
with lib;
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  environment.systemPackages = with pkgs; [
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    hyprcursor
    dunst
    libnotify
    # rofi-wayland
    wofi
    hyprlock
    wl-clipboard
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;

  # Wayland
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    EGL_PLATFORM = "wayland";
  };
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "luke";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
