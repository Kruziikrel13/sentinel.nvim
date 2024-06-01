local lazyKeyBind = require('util').lazyKeyBind

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true
    },
    event = { 'BufEnter' },
    keys = {
      lazyKeyBind('<leader>gs', '<cmd>Gitsigns<cr>', 'Git Signs')
    },
    config = true,
  }
}
