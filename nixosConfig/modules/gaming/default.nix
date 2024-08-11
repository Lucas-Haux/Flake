{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher # Minecraft
  ];
}
