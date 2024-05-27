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

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixarr.url = "github:rasmus-kirk/nixarr";

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixarr,
    nixvim,
    ...
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          home-manager.nixosModules.home-manager
	  nixvim.nixosModules.nixvim
          ./nixosConfig/desktop
        ];
      };
    };

    nixosConfigurations = {
      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./nixosConfig/server
          nixarr.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "luke@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./homeManager/desktop
        ];
      };
    };
    overlays = import ./overlays {inherit inputs;};
  };
}
