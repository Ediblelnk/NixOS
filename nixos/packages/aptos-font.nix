{
  lib,
  stdenvNoCC,
  fetchzip,
  pkgs ? import <nixpkgs> { },
}:

stdenvNoCC.mkDerivation rec {
  pname = "aptos-font";
  version = "0.1.0";

  src = fetchzip {
    url = "https://download.microsoft.com/download/8/6/0/860a94fa-7feb-44ef-ac79-c072d9113d69/Microsoft%20Aptos%20Fonts.zip";
    stripRoot = false;
    hash = "";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype

    runHook postInstall
  '';
}
