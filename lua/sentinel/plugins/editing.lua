local Util = require('util')
return {
  {
    'numToStr/Comment.nvim',
    config = true,
    lazy = false
  },
  {
    'altermo/ultimate-autopair.nvim',
    config = true,
    event = { 'InsertEnter', 'CmdLineEnter' }
  },
  {
    'max397574/better-escape.nvim',
    config = true
  },
  {
    'kylechui/nvim-surround',
    config = true
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
    opts = {
      exclude = { filetypes = { 'nvimtree', 'dashboard' } },
      scope = { enabled = true }
    },
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    main = 'ibl'
  },
  {
    'rmagatti/auto-session',
    opts = {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      pre_save_cmds = { 'NvimTreeClose' },
    },
    config = function (_, opts)
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
      require('auto-session').setup(opts)
      Util.on_plugin_load('telescope.nvim', function()
        require('telescope').load_extension('session-lens')
      end)
    end,
    lazy = false,
  },
  {
    'gelguy/wilder.nvim',
    opts = {
      modes = {':', '/', '?'}
    },
    config = function (_, opts)
      local wilder = require('wilder')
      wilder.setup(opts)

      wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_border_theme({
        highlighter = wilder.basic_highlighter(),
        max_height = '10%',
        highlights = {
          border = 'Normal'
        },
        border = 'rounded'
      })
      ))
    end
  },
  {
    'yorickpeterse/nvim-window',
    config = true,
    keys = {
      { '<C-w>s', '<cmd>lua require("nvim-window").pick()<cr>', desc = 'Jump Window'}
    }
  },
  {
    'dstein64/nvim-scrollview',
    config = true
  }
}
