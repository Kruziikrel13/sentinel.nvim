nvim-nightly:
(final: prev: {
  sentinel = final.callPackage ./package.nix {
    neovim-unwrapped = nvim-nightly.packages.${final.stdenv.hostPlatform.system}.default;
  };
})
