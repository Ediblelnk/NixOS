{ config, pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.blueman.settings = {
    General = {
      Enable = true;
      AutoEnable = true;
    };
  };
}

// Enable Bluetooth support // Enable the Bluetooth service and configure it
// Use the BlueZ package for Bluetooth functionality
// Enable the Blueman service for managing Bluetooth devices
// Set general settings for Bluetooth
