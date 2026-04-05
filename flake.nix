{
  description = "Custom Neovim Configuration";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forEachSystem (
        system: pkgs: {
          default = import ./nix/shell.nix {
            inherit pkgs;
            inherit (self.packages.${system}) sentinel;
          };
        }
      );
      packages = forEachSystem (
        system: pkgs: rec {
          sentinel = pkgs.callPackage ./nix/package.nix { };
          default = sentinel;
        }
      );
    };
}
