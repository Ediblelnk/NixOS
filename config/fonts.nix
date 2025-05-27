{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [ font-awesome ];
}
