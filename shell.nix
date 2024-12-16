{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  buildInputs = [
    gcc
    tree-sitter
    stylua
    lua-language-server
  ];
}
