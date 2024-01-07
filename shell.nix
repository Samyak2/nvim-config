{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  buildInputs = [
    gcc
    stylua
  ];
}
