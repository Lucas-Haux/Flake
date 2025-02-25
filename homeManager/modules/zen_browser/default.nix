{
  pkgs,
  ...
}:

let
  zenConfigRepo = "https://github.com/steven-na/zen-browser-theming.git";

  zenConfig = pkgs.fetchgit {
    url = zenConfigRepo;
    # rev = "main";  # or specify the commit/branch you want
    hash = "sha256-gMP0xT27VecEWcbkrs7XmgRNdzvRZmnTqFCNv+6dewM=";
  };

  profilesIni = builtins.readFile (builtins.getEnv "HOME" + "/.zen/profiles.ini");

  profile = builtins.match "Path=(.*)" profilesIni;

in
{
  builtins.trace = ("!!!!!!!!!!!!!!!!: " + profile) profile;

}
