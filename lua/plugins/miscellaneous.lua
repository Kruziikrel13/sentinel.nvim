--[[
  File: plugins/miscellaneous.lua
  Description: Plugin spec for plugins that I haven't categorized
]]
return {
  {
    -- Session Management
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    opts = {
      autosave = {
        current = true,
        cwd = true
      },
      autoload = 'last_cwd'
    }
  },

  {
    -- Indent Lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      exclude = { filetypes = { 'nvimtree', 'dashboard' } },
      scope = { enabled = true }
    },
    main = 'ibl'
  },

  {
    -- Autopairs
    'altermo/ultimate-autopair.nvim',
    event = 'InsertEnter',
    opts = {},
  },

  {
    -- Change display based on neovim mode
    'sitiom/nvim-numbertoggle'
  },

  {
    -- Quickfix formatting
    'stevearc/quicker.nvim',
    ft = "qf",
    opts = {}
  },

  {
    -- Startup Screen
    'echasnovski/mini.starter',
    opts = {
      query_updaters = 'abcdefghijklmnopqrsuvwxyz0123456789_-.'
    },
  },

  {
    -- Help View Formatting
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },

  {
    -- Markdown Previewer
    'OXY2DEV/markview.nvim',
    ft = { 'markdown', 'html' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },

  {
    -- UI Library
    'stevearc/dressing.nvim',
    opts = {
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
        mappings = {
          n = {
            ['q'] = 'Close'
          }
        }
      }
    },
    config = true,
    dependencies = {
      'MunifTanjim/nui.nvim',
      { 'smjonas/inc-rename.nvim', opts = { input_buffer_type = 'dressing' }, optional = true }
    }
  },

  {
    -- Notifications Library
    'rcarriga/nvim-notify',
    opts = {
      fps = 60,
      stages = 'slide',
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false, zindex = 175 })
      end,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end
    },
    config = function(_, opts)
      local notify = require('notify')
      notify.setup(opts)
      vim.notify = notify
    end
  }
}
