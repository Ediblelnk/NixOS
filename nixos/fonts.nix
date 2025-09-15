{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.arimo

    font-awesome
    noto-fonts
    corefonts
    vista-fonts
  ];
}
