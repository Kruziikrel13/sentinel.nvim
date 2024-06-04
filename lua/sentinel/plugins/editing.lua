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
    'lukas-reineke/indent-blankline.nvim',
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
    opts = {
      exclude = { filetypes = { 'nvimtree', 'dashboard' } },
      scope = { enabled = true }
    },
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
        Util.map('n', '<leader>fs', '<cmd>Telescope session-lens search_session<cr>')
      end)
    end,
    lazy = false,
  },
  {
    'dstein64/nvim-scrollview',
    config = true
  }
}
