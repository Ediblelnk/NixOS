{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gcc
    gnumake
    clang-tools

    rustc
    cargo
    rust-src
    rust-analyzer

    swi-prolog
  ];
  buildInputs = with pkgs; [
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        matplotlib
        jupyter
        notebook
        numpy
        pygame
      ]
    ))
  ];

  shellHook = ''
    export RUST_SRC_PATH="${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}"
    source ~/.bashrc
  '';
}
