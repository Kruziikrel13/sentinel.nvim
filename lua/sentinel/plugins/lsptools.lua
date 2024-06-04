local lazyKeyBind = require('util').lazyKeyBind
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPre", "BufNewFile" },
    version = '*',
    opts = {
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      indent = { enable = true },
      incremental_selection = { enable = true },

      auto_install = true
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      require('nvim-treesitter.install').compilers = { 'gcc', 'clang' }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'm-demare/hlargs.nvim',
    config = true
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy'
  }
}
