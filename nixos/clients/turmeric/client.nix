{ config, pkgs, ... }:
{
  imports = [ ./hardware.nix ];
  networking.hostName = "turmeric";
}
