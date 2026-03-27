{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # rust
    rustc
    cargo
    rust-analyzer

    # c/c++
    gcc
    gnumake
    clang-tools

    # python
    python313
    jupyter

    # LaTeX
    texliveFull

    # npm
    nodejs
    yarn
  ];
}
