{ stdenvNoCC, fetchzip, ... }:

stdenvNoCC.mkDerivation {
  pname = "garamond-font";
  version = "0.1.0";

  src = fetchzip {
    url = "https://font.download/dl/font/garamond.zip";
    stripRoot = false;
    hash = "sha256-eeQFFeK3KNwlAaLlaXQ2Kzwqe1I+OtG4rAfpgjdLSWA=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype

    runHook postInstall
  '';
}
