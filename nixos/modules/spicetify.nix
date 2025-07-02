{ config, pkgs, spicePkgs, ... }: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [ ];
    theme = spicePkgs.themes.sleek;
    colorScheme = "coral";
  };
}
