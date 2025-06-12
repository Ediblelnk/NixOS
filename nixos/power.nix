{ config, pkgs, ... }: {
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  environment.systemPackages = with pkgs; [ acpi upower ];

}
