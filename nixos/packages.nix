{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim

    brave
    firefox
    google-chrome

    discord

    github-desktop
    vscode
    libsecret
    pix

    nixfmt-classic
    stow
    git
    fzf
    starship
  ];
}
