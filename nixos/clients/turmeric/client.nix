{ ... }:
{
  imports = [ ./hardware-configuration.nix ../../modules/nvidia.nix ../../modules/openrgb.nix];
  networking.hostName = "turmeric";
}
