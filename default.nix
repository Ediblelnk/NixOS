{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    rustup
    swi-prolog
    (python3.withPackages (python-pkgs: [
      python-pkgs.cryptography
      python-pkgs.matplotlib
      python-pkgs.pillow
      python-pkgs.jupyter
      python-pkgs.notebook
      python-pkgs.numpy
      python-pkgs.pygame
    ]))
  ];

  shellHook = ''
    source ~/.bashrc
  '';
}
