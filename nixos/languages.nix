{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # rust
    rustup
    libgcc

    # python
    python313
    python313Packages.dbus-python
    python313Packages.cryptography

    # LaTeX
    miktex
  ];
}
