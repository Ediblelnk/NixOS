{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim

    libreoffice-qt
    hunspell
    hunspellDicts.en_US

    brave
    google-chrome
    firefox
    signal-desktop

    discord
    # spotify -- this is done through a flake for spicetify

    github-desktop
    vscode
    libsecret
    pix

    nixfmt-classic
    just
    stow
    git
    fzf
    zip
  ];
}
