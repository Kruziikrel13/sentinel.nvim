local lazyKeyBind = require('util').lazyKeyBind
local has = require('util').has

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvimdev/lspsaga.nvim',
      { 'folke/neodev.nvim', opts = {} },
    },
  },
  {
    'folke/neodev.nvim',
    ft = 'lua',
    event = "VeryLazy",
  },
  {
    'zeioth/garbage-day.nvim',
    event = 'VeryLazy',
    config = true,
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  {
    'j-hui/fidget.nvim',
    config = true,
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function(_, opts)

      if has('gitsigns.nvim') then
        opts.code_action = {
          extend_gitsigns = true
        }
      end
      require('lspsaga').setup(opts)
    end,
    keys = {
      lazyKeyBind('<Tab><Tab>', '<cmd>Lspsaga hover_doc<cr>', 'Hover Info'),
      lazyKeyBind('<Tab>d', '<cmd>Lspsaga goto_definition<cr>', 'Goto Definition'),
      lazyKeyBind('<Tab>r', '<cmd>Lspsaga rename ++project<cr>', 'Rename Symbol'),
      lazyKeyBind('<Tab>a', '<cmd>Lspsaga code_action<cr>', 'Code Actions'),
      lazyKeyBind('<Tab>o', '<cmd>Lspsaga outline<cr>', 'Code Outline')
    }
  }
}
