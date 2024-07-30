local settings = require('configuration')
local actions = {}
if settings.lsp_actions == 'tiny-action' then
  actions = {
    'rachartier/tiny-code-action.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    keys = {
      { '<Tab>a', function()
        require("tiny-code-action").code_action()
      end, desc = 'Code Action' }
    }
  }
elseif settings.lsp_actions == 'clear-action' then
  actions = {
    'luckasRanarison/clear-action.nvim',
    opts = {},
    keys = {
      { '<Tab>a', function()
        require('clear-action').code_action()
      end, desc = 'Code Action' }
    }
  }
end

return actions
