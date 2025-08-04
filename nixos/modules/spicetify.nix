{ config, pkgs, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  # Enable the spicetify module
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.sleek;
    colorScheme = "Coral";
    enabledExtensions = [ ];
  };
}
