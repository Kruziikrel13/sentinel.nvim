local whichKeyGroup = require('util').whichKeyGroup
local lazyKeyBind = require('util').lazyKeyBind
return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      keybind_groups = {
        ['<leader>x'] = whichKeyGroup('Utilities'),
        ['<leader>g'] = whichKeyGroup('Git'),
        ['<Tab>'] = whichKeyGroup('Language Server')
      }
    },
    config = function(_, opts)
      local module = require('which-key')
      module.setup(opts)
      module.register(opts.keybind_groups)
    end

  },
  {
    'FeiyouG/commander.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
      lazyKeyBind('<leader>fC', '<cmd>Telescope commander<cr>', 'Commander')
    },
    opts = {
      integration = {
        telescope = { enable = true },
        lazy = { enable = true }
      }
    }
  }
}
