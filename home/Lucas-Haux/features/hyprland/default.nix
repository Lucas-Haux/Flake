{ lib, config, pkgs, ... }: {
  imports = [
    ./binds.nix
  ];
    # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Manager
  services.xserver.displayManager.gdm.enable = true;

  # Enable hyperland
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    hardware = {
      opengl.enable = true;
      nvidia.modesetting.enable = true;
  };

  home.packages = with pkgs; [
    pkgs.waybar
        (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        }))
    pkgs.dunst
    libnotify
    swww
    wl-clipboard
  ];
  }
