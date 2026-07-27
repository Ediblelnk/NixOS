{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # this is needed by some Xorg games when using proton (e.g. TrackMania)
  environment.systemPackages = with pkgs; [ gamescope ];
}
