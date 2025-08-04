{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim

    brave
    google-chrome
    firefox
    signal-desktop

    discord
    # spicetify-cli
    # spotify

    github-desktop
    vscode
    libsecret
    pix

    nixfmt-classic
    just
    stow
    git
    fzf
  ];
}
