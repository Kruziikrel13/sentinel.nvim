return {
  {
    'zeioth/garbage-day.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  {
    'hinell/lsp-timeout.nvim',
    branch = 'dev',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' }
  }
}
