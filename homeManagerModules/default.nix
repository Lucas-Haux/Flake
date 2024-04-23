
{ inputs, ... }: {

  # may look a bit different
  home-manager."luke" = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "username" = import ./home.nix;
      modules = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };

}
