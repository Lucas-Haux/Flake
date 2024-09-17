{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher # Minecraft
    tetrio-desktop # Tetris 
  ];
}
