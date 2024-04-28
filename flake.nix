{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/Hyprland";
  };
  
  outputs = { nixpkgs, home-manager, ...}@inputs:
  let
       system = "x86_64-linux";
  in {
    nixosConfigurations = (
      import ./hosts/desktop {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager;   # Inherit inputs
      }
    );

    homeConfigurations = (
      import ./homeManagerModules/home.nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager;
        }
    );
 };
}
