local conf = require('configuration')
local hover = {}

if conf.lsp.hover == 'hover.nvim' then
  hover = {
    'lewis6991/hover.nvim',
    opts = {
      init = function()
        require('hover.providers.lsp')
        require('hover.providers.diagnostic')
        local Plugins = require('helpers.plugins')
        if Plugins.has('nvim-dap') then
          require('hover.providers.dap')
        end
      end,
      title = false,
      preview_window = true
    },
    config = function (_, opts)
      require('hover').setup(opts)
      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'Hover Doc' })
    end,
    keys = {
      { '<Tab><Tab>', function(_, opts)
        require('hover').hover(opts)
      end, desc = 'Hover Doc' },
      { '<Tab>s', function(_, opts)
        require('hover').hover_select(opts)
      end, desc = 'Hover Doc Select' }
    }
  }
elseif conf.lsp.hover == 'lspsaga.nvim' then
  hover = {
    'nvimdev/lspsaga.nvim',
    opts = {
      breadcrumbs = {
        enable = false
      },
      finder = {
        keys = {
          vsplit = "<C-v>",
          split = "<C-x>",
          toggle_or_open = "<CR>"
        }
      },
      rename = {
        keys = {
          quit = '<Esc>',
          select = 'e'
        }
      },
      lightbulb = {
        sign = false
      }
    },
    keys = {
      { '<Tab><Tab>', '<cmd>Lspsaga hover_doc<cr>',
        desc = 'Hover Doc' },
      { '<Tab>r', '<cmd>Lspsaga rename ++project<cr>',
        desc = 'Rename' },
      { '<Tab>d', '<cmd>Lspsaga peek_definition<cr>',
        desc = 'Peek' },
      { '<Tab>f', '<cmd>Lspsaga finder<cr>',
        desc = 'Find' }
    }
  }
end

return hover
