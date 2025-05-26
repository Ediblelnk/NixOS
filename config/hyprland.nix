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
    wofi # application launcher
    waybar # status bar for Wayland
  ];
}
