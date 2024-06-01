local lazyKeyBind = require('util').lazyKeyBind
return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      update_focused_file = {
        enable = true
      },
      modified = {
        enable = true,
      },
    },
    config = true,
    lazy = false,
    keys = {
      lazyKeyBind('t', '<cmd>NvimTreeFindFileToggle<cr>', 'Explorer')
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  }
}
