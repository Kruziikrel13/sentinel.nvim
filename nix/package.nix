{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,

  gcc,
  ripgrep,
  fzf,
  lazygit,
  tree-sitter,
  inlyne,

  lua-language-server,
  stylua,

  extraPackages ? [ ],
}:
wrapNeovimUnstable neovim-unwrapped rec {
  pname = "sentinel.nvim";
  version = "01.02.2026";

  dependencies = [
    gcc
    ripgrep
    fzf
    lazygit
    tree-sitter

    inlyne
    lua-language-server
    stylua
  ];

  viAlias = true;
  vimAlias = true;
  waylandSupport = true;
  wrapRc = false;
  wrapperArgs = [
    "--suffix"
    "PATH"
    ":"
    (lib.makeBinPath (dependencies ++ extraPackages))
  ];
}
