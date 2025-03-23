# TODO: use yarn2nix to build from source:
# https://nixos.org/manual/nixpkgs/stable/#javascript-yarn2nix
# https://github.com/NixOS/nixpkgs/issues/46382
{
  lib,
  appimageTools,
  fetchurl,
}:
let
  pname = "android-messages";
  version = "5.4.2";
  src = fetchurl {
    url =
      "https://github.com/OrangeDrangon/android-messages-desktop"
      + "/releases/download/v5.4.2/Android-Messages-v5.4.2-linux-x86_64.AppImage";
    hash = "sha256-/gAbBel58ktxiLjTa40XPa8iwn8oFU29oRivVLGKt5s=";
  };
  contents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${contents}/AndroidMessages.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/AndroidMessages.desktop \
      --replace 'Exec=AppRun' "Exec=$out/bin/android-messages --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    cp -r ${contents}/usr/share/icons $out/share
  '';

  meta.platforms = lib.platforms.linux;
}
