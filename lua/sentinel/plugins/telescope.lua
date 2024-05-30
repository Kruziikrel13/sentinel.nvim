local lazyKeyBind = require('util').lazyKeyBind

local function live_grep()
  require('telescope.builtin').live_grep()
end

return {
  'nvim-telescope/telescope.nvim',
  config = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-tree/nvim-web-devicons'
  },

  keys = {
    lazyKeyBind('<leader>ff', live_grep, 'Live Grep')
  }
}
