{ config,... }:
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "turmeric";

  # because of a NVIDIA GPU on this machine
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_DRM_DEVICES = "/dev/dri/card1"; # Adjust card IDs as needed
    WLR_NO_HARDWARE_CURSORS = "1"; # Optional: fixes cursor issues on some setups
  };
}
