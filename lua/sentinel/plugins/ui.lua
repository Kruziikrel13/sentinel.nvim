return {
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end
      }
    },
    config = true,
    dependencies = {
      'MunifTanjim/nui.nvim',
      { 'smjonas/inc-rename.nvim', opts = { input_buffer_type = 'dressing' }, optional = true }
    }
  },
  {
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
