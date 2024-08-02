local settings = require('configuration')

local theme = {}
if settings.theme == 'flow'then
  theme = {
    '0xstepit/flow.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = settings.enable_transparency,
      fluo_color = 'orange',
      mode = 'normal',
      aggressive_spell = false
    },
    config = function (_, opts)
      require('flow').setup(opts)
      vim.cmd.colorscheme('flow')
    end
  }
elseif settings.theme == 'github' then
  theme = {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        dim_inactive = true,
        transparent = settings.enable_transparency
      }
    },
    config = function(_, opts)
      local github = require('github-theme')
      github.setup(opts)
      github.compile(false)
      vim.cmd.colorscheme('github_' .. settings.mode .. '_default')
    end

  }
end

return theme
