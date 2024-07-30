{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [ pkgs.gnumake pkgs.luajitPackages.busted ];
}
