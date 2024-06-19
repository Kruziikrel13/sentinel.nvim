local whichKeyGroup = require('utils.keys').whichKeyGroup

local keymap_fns = {
  telescope = {}
}

function keymap_fns.telescope.live_grep()
  require('telescope.builtin').live_grep()
end


return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      keybind_groups = {
        ['<leader>x'] = whichKeyGroup('Utilities'),
        ['<leader>f'] = whichKeyGroup('Finder'),
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
      },
      keymaps = {
        { '<leader>xL', '<cmd>Lazy<cr>', description = 'Lazy'},
        { '<C-s>', '<cmd>w<cr>', description = 'Save File'},
        { '<C-q>', '<cmd>qa!<cr>', description = 'Quit All'},
        { '00', '^', opts = { silent = true, noremap = true }},
        { '<leader>ff', keymap_fns.telescope.live_grep, description = 'Telescope: Live Grep'}
      }
    }
  }
}
