{
  description = "Flutter environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          android_sdk.accept_license = true;
          allowUnfree = true;
          config.permittedInsecurePackages = [
            "olm-3.2.16"
          ];
        };
        androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
        androidComposition = androidEnv.composeAndroidPackages {
          ## Details about default values: https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/mobile/androidenv/compose-android-packages.nix
          #
          buildToolsVersions = [
            "30.0.3"
            "35.0.0"
          ];
          platformVersions = [
            "31"
            "32"
            "33"
            "34"
          ];
          cmakeVersions = [ "3.18.1" ];
          includeNDK = true;
          ndkVersion = "23.1.7779620";
          useGoogleAPIs = true;
          extraLicenses = [
            "android-googletv-license"
            "android-sdk-arm-dbt-license"
            "android-sdk-license"
            "android-sdk-preview-license"
            "google-gdk-license"
            "intel-android-extra-license"
            "intel-android-sysimage-license"
            "mips-android-sysimage-license"
          ];
        };
        androidSdk = androidComposition.androidsdk;
      in
      {
        devShell =
          with pkgs;
          mkShell rec {
            ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
            ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
            JAVA_HOME = jdk17.home;
            JAVA_8_HOME = jdk8.home;
            JAVA_17_HOME = jdk17.home;
            FLUTTER_ROOT = flutter324;
            DART_ROOT = "${flutter324}/bin/cache/dart-sdk";
            GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/35.0.0/aapt2";
            QT_QPA_PLATFORM = "wayland;xcb"; # emulator related: try using wayland, otherwise fall back to X
            # NB: due to the emulator's bundled qt version, it currently does not start with QT_QPA_PLATFORM="wayland".
            # Maybe one day this will be supported.
            buildInputs = [
              ## General needs
              flutter324

              ## Android target
              androidSdk
              jdk17
              jdk8 # for gradle sake...
            ];
            # Globally installed packages, which are installed through `dart pub global activate package_name`,
            # are located in the `$PUB_CACHE/bin` directory.
            shellHook = ''
              if [ -z "$PUB_CACHE" ]; then
                export PATH="$PATH:$HOME/.pub-cache/bin"
              else
                export PATH="$PATH:$PUB_CACHE/bin"
              fi

              flutter doctor -v

              ## Just to please Gradle with a JDK8
              echo
              echo
              echo "Please Make Sure That: '$HOME/.gradle/gradle.properties' contains:"
              echo "org.gradle.java.installations.paths=$JAVA_8_HOME,$JAVA_17_HOME"
              echo
              echo
            '';
          };
      }
    );
}
