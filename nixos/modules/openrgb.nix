{ pkgs, ... }:

{
  # Enable the OpenRGB service
  services.hardware.openrgb.enable = true;

  # Install the package (optional if service is enabled, but recommended for CLI/GUI)
  environment.systemPackages = [ pkgs.openrgb-with-all-plugins ];

  # Required kernel modules for hardware access
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

  # Enable I2C bus access
  hardware.i2c.enable = true;

  # Add OpenRGB udev rules
  services.udev.packages = [ pkgs.openrgb ];

  # Add your user to the i2c group
  users.groups.i2c.members = [ "edibleink" ];
}
