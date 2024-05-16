{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    ocaml
    ocamlPackages.menhir
    ocamlPackages.dune_3
    ocamlPackages.utop
  ];
}