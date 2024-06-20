# This file defines overlays
{inputs, ...}: {
   # nixpkgs.overlays = [ (self: super: {
   #      floorp-unwrapped = super.floorp-unwrapped.overrideAttrs (old: {
   #          version = "11.13.2";
   #          src = super.fetchFromGitHub {
   #            owner = "Floorp-Projects";
   #            repo = "Floorp";
   #            rev = "v11.13.2";
   #            #    sha256 = lib.fakeSha256;
   #            sha256 = "sha256:4f1c41c3d7cafb29a9d09e4a7a8b462f887f287973c2d7e7f9efaafa1c3d81f1";
   #          };
   #      });
   # }) ];
}
