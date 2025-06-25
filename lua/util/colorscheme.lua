local M = {}

local colorschemes = {
  cyberdream = {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
  },
  github_dark_default = {
    'projekt0n/github-nvim-theme',
    opts = {
      options = {
        dim_inactive = true,
      }
    },
    config = function(_, opts)
      local github = require('github-theme')
      github.setup(opts)
      github.compile(false)
      vim.opt.background = 'dark'
    end
  },
  github_light_default = {
    'projekt0n/github-nvim-theme',
    opts = {
      options = {
        dim_inactive = true,
      }
    },
    config = function(_, opts)
      local github = require('github-theme')
      github.setup(opts)
      github.compile(false)
      vim.opt.background = 'light'
    end

  }
}

local colorscheme
function M.setup(theme)
  if colorschemes[theme] ~= nil then
    colorscheme = colorschemes[theme]
    colorscheme = vim.tbl_deep_extend('force', colorscheme, {
      name = theme
    })
  end
end

function M.enable()
  Sentinel.track('colorscheme')
  Sentinel.try(function()
    vim.cmd.colorscheme(colorscheme.name)
  end, {
      msg = 'Could not load your colorscheme',
      on_error = function(msg)
        Sentinel.error(msg)
        vim.cmd.colorscheme('habamax')
      end
    })
  Sentinel.track()
end

setmetatable(M, {
  __call = function()
    if colorscheme ~= nil then
      return colorscheme
    end
    return {}
  end
})

return M
