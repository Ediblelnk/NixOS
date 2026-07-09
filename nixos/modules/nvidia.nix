{ config, ... }:
{
  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;

    # CRITICAL: Switch to proprietary drivers to fix the missing suspend interface
    open = false;

    # Enable power management
    powerManagement.enable = true;
    powerManagement.finegrained = false; # Recommended for stability

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_DRM_DEVICES = "/dev/dri/card1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Kernel parameters
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1" # Helps prevent black screen on resume
  ];

  # Module options
  boot.extraModprobeConfig = ''
    options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
    options nvidia_drm modeset=1 fbdev=1
  '';

  # Enable NVIDIA systemd services
  systemd.services.nvidia-suspend.enable = true;
  systemd.services.nvidia-hibernate.enable = true;
  systemd.services.nvidia-resume.enable = true;
}
