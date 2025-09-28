{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk3,
  breeze-icons,
  gnome-icon-theme,
  numix-icon-theme,
  numix-icon-theme-circle,
  hicolor-icon-theme,
  jdupes,
  gitUpdater,
}:

stdenvNoCC.mkDerivation rec {
  pname = "zafiro-nord-dark";
  version = "master";

  src = fetchFromGitHub {
    owner = "zayronxio";
    repo = pname;
    rev = version;
    sha256 = "sha256-1MrqWxOAB0Q3w3B+UiowYXqZVdYF+sGYbN82Ay5LkhY=";
  };

  nativeBuildInputs = [
    gtk3
    jdupes
  ];

  propagatedBuildInputs = [
    breeze-icons
    gnome-icon-theme
    numix-icon-theme
    numix-icon-theme-circle
    hicolor-icon-theme
    # still missing parent icon themes: Surfn
  ];

  dontDropIconThemeCache = true;

  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons

    cp -a . $out/share/icons/Zafiro-Nord-Dark

    # remove unneeded files
    rm $out/share/icons/Zafiro-Nord-Dark/_config.yml

    gtk-update-icon-cache $out/share/icons/Zafiro-Nord-Dark

    jdupes --link-soft --recurse $out/share

    runHook postInstall
  '';

  passthru.updateScript = gitUpdater { };

  meta = with lib; {
    description = "Icon pack flat with light colors";
    homepage = "https://github.com/zayronxio/Zafiro-Nord-Dark";
    license = with licenses; [ gpl3 ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ t4sm5n ];
  };
}
