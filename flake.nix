{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nvim-nightly.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      nvim-nightly,
    }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forEachSystem (
        system: pkgs: rec {
          sentinel = pkgs.callPackage ./nix/package.nix {
            neovim-unwrapped = nvim-nightly.packages.${system}.default;
          };
          default = sentinel;
        }
      );
    };
}
