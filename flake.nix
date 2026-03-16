{
  description = "Custom Neovim Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nvim-nightly.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:NotAShelf/nvf";
  };
  outputs =
    {
      self,
      nixpkgs,
      nvim-nightly,
      nvf,
    }:
    let
      inherit (nixpkgs) lib;
      overlayPkgs = p: p.appendOverlays [ nvim-nightly.overlays.default ];
      systems = lib.platforms.linux;
      forEachSystem =
        fn: lib.genAttrs systems (system: fn system (overlayPkgs nixpkgs.legacyPackages.${system}));
    in
    {
      packages = forEachSystem (
        system: pkgs: {
          sentinel = pkgs.callPackage ./nix/package.nix {
            neovim-unwrapped = nvim-nightly.packages.${system}.default;
          };
          nvf = pkgs.callPackage ./nix/nvf.nix { inherit nvf pkgs; };
        }
      );

      devShells = forEachSystem (
        system: pkgs: {
          default = import ./nix/shell.nix {
            inherit pkgs;
            inherit (self.packages.${system}) sentinel;
          };
        }
      );
    };
}
