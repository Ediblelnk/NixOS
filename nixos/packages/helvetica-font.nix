{ stdenvNoCC, fetchzip, ... }:

stdenvNoCC.mkDerivation {
  pname = "helvetica-font";
  version = "0.1.0";

  src = fetchzip {
    url = "https://font.download/dl/font/helvetica-255.zip";
    stripRoot = false;
    hash = "sha256-J5efRtnF9O8V7ARZf5pG8Kj70NIpLnYzSWty1JedF3k=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype

    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype

    runHook postInstall
  '';
}
