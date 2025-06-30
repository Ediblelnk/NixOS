{ config, pkgs, ... }: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions;
      [
        # (special characters are sanitized out of extension names)
        shuffle
      ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
