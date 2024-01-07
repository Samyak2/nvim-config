{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  buildInputs = [
    luajitPackages.luacheck
    stylua
  ];
}
