{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  buildInputs = [
    gcc
    stylua

    # plugin dependencies (build time)
    deno
  ];
}
