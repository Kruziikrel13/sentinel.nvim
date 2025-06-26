return {
  {
    'kruziikrel13/snacks.nvim',
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
  {
    "echasnovski/mini.icons",
    version = false,
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end
  },
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}
