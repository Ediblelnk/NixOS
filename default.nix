{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    rustup
    swi-prolog
    (python3.withPackages (python-pkgs: [ python-pkgs.cryptography ]))
  ];

  shellHook = ''
    source ~/.bashrc
  '';
}
