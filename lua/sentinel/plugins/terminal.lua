local lazyKeyBind = require('util').lazyKeyBind
-- Dedicated Terminals

--- Dedicated LazyGit Terminal
local lazygit_terminal = {
    display_name = 'LazyGit',
    cmd = 'lazygit',
    hidden = true,
    count = 12,
    direction = 'float'
}

local function lazygit()
    lazygit_terminal:toggle()
end

local function config(_, opts)
  require('toggleterm').setup(opts)

  local terminal = require('toggleterm.terminal').Terminal

  lazygit_terminal = terminal:new(lazygit_terminal)
end

return {
    --- @see https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      direction = 'float'
    },
    config = config,
    keys = {
        lazyKeyBind('<leader>gg', lazygit, 'Lazygit'),
    }
}
