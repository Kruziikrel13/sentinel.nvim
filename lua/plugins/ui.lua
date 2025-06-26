return {
  {
    'folke/snacks.nvim',
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true }
    },
    keys = {
      { '<leader>n', function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end, desc = 'Notification History' },
      { '<leader>un', function()
        Snacks.notifier.hide()
      end, desc = 'Dismiss All Notifications' }
    }
  },
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}
