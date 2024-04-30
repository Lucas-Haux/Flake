{lib, inputs, nixpkgs, home-manager}:
let
  system = "x86_64-linux";                                  # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow Proprietary Software
  };

  lib = nixpkgs.lib;
in
{
  desktop = lib.nixosSystem {                                # Laptop Profile
    inherit system;
    specialArgs = {
      inherit inputs; # needed for hyprland and probs other stuff
      host = {
        hostName = "luke";
      };
    };
    modules = [
      ./desktop/default.nix
      ../custom-options.nix
         ];
  };
}
