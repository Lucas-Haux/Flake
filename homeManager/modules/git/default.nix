{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lucas-Haux";
    userEmail = "developer@lucas-haux.com";
  };
}
