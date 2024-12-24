{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            android_sdk.accept_license = true;
            allowUnfree = true;
          };
        };
        buildToolsVersion = "34.0.0";
        androidComposition = pkgs.androidenv.composeAndroidPackages {
          buildToolsVersions = [
            buildToolsVersion
            "30.0.3"
          ];
          platformVersions = [
            "34"
            "28"
          ]; # "VanillaIceCream"
          abiVersions = [
            "armeabi-v7a"
            "arm64-v8a"
          ];
          # includeEmulator = false;
          # emulatorVersion = "35.1.4";
          # includeSystemImages = false;
          # systemImageTypes = ["google_apis_playstore"];
        };
        androidSdk = androidComposition.androidsdk;
      in
      {
        devShell =
          with pkgs;
          mkShell {
            ANDROID_SDK_ROOT = "/home/luke/Projects/flutter/Android/Sdk/platforms/android-35/google_apis_playstore";

            buildInputs = [
              # flutterPackages-source.stable
              # flutterPackages-source.v3_24
              flutter
              firebase-tools
              androidSdk # The customized SDK
              jdk17

              android-tools
              android-studio
              # android-studio-full
              # xcode-install
              nodejs_22
              nodePackages.eslint
              nodePackages.firebase-tools
            ];
          };
        builtins.exec = [ "zsh" ];
      }
    );
}
