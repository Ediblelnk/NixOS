{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.arimo
  ];

  environment.systemPackages = with pkgs; [ font-awesome noto-fonts ];
}
