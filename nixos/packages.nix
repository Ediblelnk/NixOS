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
    themix-gui

    # CHATS AND MUSIC
    discord
    # spotify -- this is done through a flake for spicetify
    musescore
    rhythmbox
    vlc
    zoom-us
    slack
    obs-studio

    # DEV TOOLS
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    gnome-calendar
    gnome-power-manager
    gnome-online-accounts-gtk
    gnome-font-viewer

    # DEVELOPMENT
    github-desktop
    vscode
    nixfmt
    libsecret
    pix
    mdbtools

    # X11 libraries
    xorg.libX11
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXrender
    mesa

    # COMMAND LINE TOOLS
    just
    stow
    git
    fzf
    zip
    unzip
    tree
    zenity
    dialog
  ];
}
