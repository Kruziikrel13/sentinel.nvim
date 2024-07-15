return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  specs = {
    require('plugins.lsp.state'),
    require('plugins.lsp.ui'),
    require('plugins.lsp.tools')
  },
  dependencies = require('plugins.lsp.installer')
}
