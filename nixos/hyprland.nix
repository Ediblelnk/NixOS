{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  #   programs.hyprland.enable = true;
  #   programs.xwayland.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    POLKIT_AUTH_AGENT =
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprlock
    hypridle

    kitty # terminal emulator
    seahorse # GNOME keyring manager
    nemo # file manager
    rofi # application launcher
    waybar # status bar for Wayland
    swww # wallpaper setter

    killall # utility to kill processes
    brightnessctl # control screen brightness
    playerctl # media player control
    wl-clipboard # clipboard management for Wayland

    adwaita-icon-theme # icon theme
    adwaita-qt # Qt integration for Adwaita theme
    adwaita-qt6 # Qt6 integration for Adwaita theme
    gnome-themes-extra # additional GNOME themes
    qt5.qtwayland # Qt Wayland support
    qt6.qmake # Qt6 build system
    qt6.qtwayland # Qt6 Wayland support
  ];
}
