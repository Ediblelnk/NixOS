{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  #   services.displayManager.sddm.enable = true;
  #   services.displayManager.sddm.wayland.enable = true;
  #   services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  services.gnome.gnome-keyring.enable = true;
  security = {
    polkit.enable = true;
    pam.services.hyprlock = { };
    pam.services.login.enableGnomeKeyring = true;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  environment.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    POLKIT_AUTH_AGENT =
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  programs.dconf.profiles.user.databases = [{
    settings."org/gnome/desktop/interface" = {
      gtk-theme = "Gruvbox-Dark";
      icon-theme = "Adwaita";
      font-name = "FiraCode Mono Medium 10.5";
      document-font-name = "FiraCode Mono Medium 10.5";
      monospace-font-name = "FiraCode Mono Medium 10.5";
    };
  }];

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprlock
    hypridle
    hyprshot

    kitty # terminal emulator
    seahorse # GNOME keyring manager
    nautilus # file manager
    rofi # application launcher
    waybar # status bar for Wayland
    quickshell
    pywal # color scheme generator
    wpgtk # wallpaper and theme manager

    libnotify # notification library
    swaynotificationcenter
    pavucontrol
    networkmanager

    fastfetch
    lf

    killall # utility to kill processes
    brightnessctl # control screen brightness
    playerctl # media player control
    wl-clipboard # clipboard management for Wayland

    materia-theme # GTK theme
    gruvbox-gtk-theme # GTK theme

    adwaita-icon-theme # icon theme
    adwaita-qt # Qt integration for Adwaita theme
    adwaita-qt6 # Qt6 integration for Adwaita theme
    gnome-themes-extra # additional GNOME themes
    qt5.qtwayland # Qt Wayland support
    qt6.qmake # Qt6 build system
    qt6.qtwayland # Qt6 Wayland support

    # utilities for managing disks and USB devices
    udisks2
    gvfs
    usbutils
    udiskie
  ];
}
