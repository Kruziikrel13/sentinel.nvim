local settings = require('configuration')
local lazyKeyBind = require('utils.keys').lazyKeyBind
local Lib = require('utils.lib')

local lsp_helper = {}
if settings.lsp_helper == 'lspsaga' then
  lsp_helper = {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      code_action = {
        enable = false
      },
      callhierarchy = {
        enable = false
      },
      lightbulb = {
        virtual_text = false
      }
    },
    config = function(_, opts)
      require('lspsaga').setup(opts)
    end,
    keys = {
      lazyKeyBind('<Tab><Tab>', '<cmd>Lspsaga hover_doc<cr>', 'Hover Info'),
      lazyKeyBind('<Tab>d', '<cmd>Lspsaga peek_definition<cr>', 'Goto Definition'),
      lazyKeyBind('<Tab>r', '<cmd>Lspsaga rename ++project<cr>', 'Rename Symbol'),
      -- lazyKeyBind('<Tab>a', '<cmd>Lspsaga code_action<cr>', 'Code Actions'),
      lazyKeyBind('<Tab>o', '<cmd>Lspsaga outline<cr>', 'Code Outline'),
      lazyKeyBind('<Tab>f', '<cmd>Lspsaga finder<cr>', 'Symbol Finder')
    }
  }
elseif settings.lsp_helper == 'combined' then
  lsp_helper = {
    {
      'rachartier/tiny-inline-diagnostic.nvim',
      event = 'LspAttach',
      config = function()
        vim.diagnostic.config({ virtual_text = false })
        require('tiny-inline-diagnostic').setup()
      end
    },
    {
      'LukasPietzschmann/boo.nvim',
      opts = {
        max_width = 100,
        max_height = 80,
        focus_on_open = false
      },
      keys = {
        lazyKeyBind('<Tab><Tab>', '<cmd>lua require("boo").boo()<cr>', 'Lsp Boo Info')
      }
    },
    {
      'Bekaboo/dropbar.nvim',
      event = 'LspAttach',
      config = true,
      dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim', optional = true
      }
    }

  }
end
return { lsp_helper,
  {
    'luckasRanarison/clear-action.nvim',
    config = true,
    opts = {
      mappings = {
        code_action = { key = '<Tab>a', mode = { 'n' }, options = { desc = 'Code Action' } }
      }
    },
  }
}
