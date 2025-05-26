{ config, pkgs, ... }: {
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  environment.variables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    NIXOS_OZONE_WL = "1";
  };

  environment.sessionVariables = {
    POLKIT_AUTH_AGENT =
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  environment.systemPackages = with pkgs; [
    kitty # terminal emulator
    seahorse # GNOME keyring manager
    nemo # file manager
    wofi # application launcher
    waybar # status bar for Wayland

    adwaita-icon-theme # icon theme
    adwaita-qt # Qt integration for Adwaita theme
    adwaita-qt6 # Qt6 integration for Adwaita theme
    gnome-themes-extra # additional GNOME themes
    qt5.qtwayland # Qt Wayland support
    qt6.qmake # Qt6 build system
    qt6.qtwayland # Qt6 Wayland support
  ];
}
