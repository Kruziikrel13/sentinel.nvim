return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  },
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  {
    'Bekaboo/dropbar.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', optional = true }
  },
 }
