{ pkgs, config, ... }:
{ 
  environment.systemPackages = with pkgs; [
    rustc
    gcc
    rustup
    cargo
  ];
}

