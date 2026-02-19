{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WINE
    wineWow64Packages.stable
    wine
    (wine.override { wineBuild = "wine64"; })
    wine64
    wineWow64Packages.staging
    winetricks
    wineWow64Packages.waylandFull
  ];
}
