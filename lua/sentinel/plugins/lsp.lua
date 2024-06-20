return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          automatic_installation = true
        },
        dependencies = { 'williamboman/mason.nvim' }
      },
    },
  },

  -- Lsp Plugins
  {
    'zeioth/garbage-day.nvim',
    event = 'LspAttach',
    config = true,
    dependencies = { 'neovim/nvim-lspconfig' }
  },

  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    config = true,
    dependencies = { 'neovim/nvim-lspconfig' }
  },

  {
    'hinell/lsp-timeout.nvim',
    branch = 'dev',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' }
  }

}
