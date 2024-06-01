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
    'mrjones2014/legendary.nvim',
    priority = 1000,
    config = true,
    lazy = false,
    opts = {
      extensions = {
        which_key = {
          auto_register = true
        },
        lazy_nvim = true,
        nvim_tree = true
      }
    }
  }
}
