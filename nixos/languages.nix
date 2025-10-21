{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # rust
    rustup

    # python
    python313
    jupyter

    # LaTeX
    # miktex
    texliveFull

    # npm
    nodejs
    yarn
  ];
}
