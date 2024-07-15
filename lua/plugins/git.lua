local lazyKeyBind = require('utils.keys').lazyKeyBind
local settings = require('configuration')

local fugit2 = {}
if settings.enable_fugit then
  fugit2 = { -- Not there yet
    'SuperBo/fugit2.nvim',
    opts = {
      width = 100,
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
    keys = {
      lazyKeyBind('<leader>gf', '<cmd>Fugit2<cr>', 'Fugit')
    }
  }
end

return { fugit2,
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true
    },
    event = { 'BufEnter' },
    keys = {
      lazyKeyBind('<leader>gs', '<cmd>Gitsigns<cr>', 'Git Signs'),
    },
    config = true,
    dependencies = {
      {'nvimdev/lspsaga.nvim', optional = true, opts = {
        code_action = {
          extend_gitsigns = true
        }
      }}
    }
  }
}
