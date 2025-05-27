{ config, pkgs, ... }: {
  services.power-profiles-daemon.enable = true;
  services.power-profiles-daemon.defaultProfile = "performance";
}
