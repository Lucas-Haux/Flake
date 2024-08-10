{ config, pkgs, lib, nixvim, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../modules/syncthing
    ./../modules/hyprland
    ./../modules/desktopPrograms
    ./../modules/rust
    ./../modules/godot
    ./../modules/gaming
    ./../modules/cliTools
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Security
  security = {
    polkit.enable = true; # Permission control for unprivileged programs
  # tpm2.enable = true; 
    rtkit.enable = true; # Needed for pipewire
  };

  # Nix
  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions =
      lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
    # Nix storage
    optimise = { # hardlinks files if they are identical 
      automatic = true;
      dates = [ "03:45" ];
    };
    gc = { # removes old nix generations
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Nixpkgs
  nixpkgs = {
    config ={
      experimental.features = true;
      allowUnfree = true;      
    };
  };

  # Networking
  networking = {
    hostName = "nixosDesktop"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Internationalisation properties
  time.timeZone = "America/Los_Angeles";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  hardware.keyboard.qmk.enable = true;

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # printing
  services.printing.enable = true; # Enable CUPS to print documents.

  # Sound
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Users
  users.users.luke = {
    isNormalUser = true;
    description = "luke";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  system.stateVersion = "24.05";
}
