{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rustup
    libgcc
    python313
    python313Packages.dbus-python
    miktex

  ];
}
