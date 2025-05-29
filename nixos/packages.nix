{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    brave
    github-desktop
    vscode
    libsecret
    nixfmt-classic

    stow
    git
  ];
}
