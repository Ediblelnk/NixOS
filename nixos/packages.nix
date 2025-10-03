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

    # LIBREOFFICE
    libreoffice-qt
    hunspell
    hunspellDicts.en_US

    brave
    google-chrome
    firefox
    signal-desktop
    obsidian

    # CHATS AND MUSIC
    discord
    # spotify -- this is done through a flake for spicetify
    zoom-us
    slack

    # DEV TOOLS
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    gnome-calendar
    gnome-power-manager

    # DEVELOPMENT
    github-desktop
    vscode
    nixfmt-classic
    libsecret
    pix
    mdbtools

    # COMMAND LINE TOOLS
    just
    stow
    git
    fzf
    zip
    unzip
    tree
  ];
}
