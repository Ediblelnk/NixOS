{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "turmeric";

  # because of a NVIDIA GPU on this machine
  hardware = {
    nvidia.modesetting.enable = true;
    nvidia.open = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
