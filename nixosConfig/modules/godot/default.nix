{ pkgs, config, ...}: 
{
  environment.systemPackages = [
    pkgs.godot_4
  ];
}
