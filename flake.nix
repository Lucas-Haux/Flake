{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    };
    nix-colors = {
      url = "github:misterio77/nix-colors";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:Lucas-Haux/nixvim";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      # desktop computer Config
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            ./nixosConfig/desktop

            (import ./overlays)
          ];
        };
      };

      # server computer Config
      nixosConfigurations = {
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixosConfig/server
          ];
        };
      };

      # desktop computer Home Manager
      homeConfigurations = {
        "luke@desktop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./homeManager/desktop ];
        };
      };

      # server computer Home-Manager
      homeConfigurations = {
        "luke@server" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./homeManager/server ];
        };
      };
    };
}
