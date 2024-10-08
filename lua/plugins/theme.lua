local configuration = require('configuration')

local theme = {}
if configuration.theme.preset == 'flow'then
  theme = {
    '0xstepit/flow.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = configuration.theme.transparency,
      fluo_color = 'orange',
      mode = 'normal',
      aggressive_spell = false
    },
    config = function (_, opts)
      require('flow').setup(opts)
      vim.cmd.colorscheme('flow')
    end
  }
elseif configuration.theme.preset == 'github' then
  theme = {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        dim_inactive = true,
        transparent = configuration.theme.transparency
      }
    },
    config = function(_, opts)
      local github = require('github-theme')
      github.setup(opts)
      github.compile(false)
      vim.cmd.colorscheme('github_' .. configuration.theme.mode .. '_default')
    end

  }
elseif configuration.theme.preset == 'serene' then
  theme = {
    'samharju/serene.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      if configuration.theme.transparency then
        vim.cmd.colorscheme('serene-transparent')
      else
        vim.cmd.colorscheme('serene')
      end
    end
  }
end

return theme
