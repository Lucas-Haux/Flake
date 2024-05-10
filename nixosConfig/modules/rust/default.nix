{ pkgs, config, ... }:
{ 
  envriomental.systemPackages = with pkgs; [
    rustc
    gcc
    rustup
    cargo
  ];
}

