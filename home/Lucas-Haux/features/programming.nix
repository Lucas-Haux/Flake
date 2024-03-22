{ inputs, lib, pkgs, config, outputs, ... }:
  home.packages = with pkgs; [
    rustup
    nodejs
    python3
    gcc
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.7"
  ];
}
