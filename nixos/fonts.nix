{ config, pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.arimo

      font-awesome
      noto-fonts
      corefonts
      vista-fonts
      inter
      garamond-libre
    ];
  };
}
