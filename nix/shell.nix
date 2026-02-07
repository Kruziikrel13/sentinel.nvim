{
  pkgs ? import <nixpkgs> { },
  sentinel ? pkgs.callPackage ./package.nix { },
}:
pkgs.mkShell {
  inputsFrom = [ sentinel ];
}
