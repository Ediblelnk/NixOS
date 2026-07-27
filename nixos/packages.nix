{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim

    # LIBREOFFICE
    libreoffice-qt
    hunspell
    hunspellDicts.en_US

    brave
    signal-desktop
    obsidian

    # CHATS AND MUSIC
    discord
    # spotify -- this is done through a flake for spicetify
    musescore
    rhythmbox
    vlc
    zoom-us
    slack
    obs-studio
    cheese

    # GNOME APPS
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    gnome-calendar
    gnome-power-manager
    gnome-online-accounts-gtk
    gnome-font-viewer
    evince

    # DEVELOPMENT
    github-desktop
    xdg-utils # used with github-desktop
    vscode
    nixfmt
    libsecret
    pix
    mdbtools

    # X11 libraries
    libx11
    libxrandr
    libxcursor
    libxrender
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
    gh
    bat
    cava
    bottom
    lsd
    powertop
    tldr
  ];
}
