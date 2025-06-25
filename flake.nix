{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    # nixpkgs-unstable = {
    #   url = "github:nixos/nixpkgs/nixos-unstable";
    # };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:Lucas-Haux/nixvim";
    nixcord.url = "github:kaylorben/nixcord";
    ags.url = "github:Aylur/ags";
    astal.url = "github:Aylur/astal";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
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
          modules = [
            ./homeManager/desktop
          ];
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
