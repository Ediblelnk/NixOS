{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # rust
    rustup

    # python
    python313

    # LaTeX
    # miktex
    texliveFull

    # npm
    nodejs
    yarn
  ];
}
