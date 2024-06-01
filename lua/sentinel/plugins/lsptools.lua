local lazyKeyBind = require('util').lazyKeyBind
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPre", "BufNewFile" },
    version = '*',
    opts = {
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
      highlight = { enable = true },
      auto_install = true
    },
    config = true,
    main = 'nvim-treesitter.configs'
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true
  },
  {
    'm-demare/hlargs.nvim',
    config = true
  }
}
