{
  description = "Custom Neovim Configuration";
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
      overlayPkgs = p: p.appendOverlays [ self.overlays.default ];
      systems = lib.platforms.linux;
      forEachSystem =
        fn: lib.genAttrs systems (system: fn system (overlayPkgs nixpkgs.legacyPackages.${system}));
    in
    {
      overlays.default = import ./nix/overlay.nix nvim-nightly;
      packages = forEachSystem (
        system: pkgs: rec {
          inherit (pkgs) sentinel;
          default = sentinel;
        }
      );
    };
}
