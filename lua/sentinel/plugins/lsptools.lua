local settings = require('configuration')
local lazyKeyBind = require('utils.keys').lazyKeyBind

local lsp_helper = {}
if settings.lsp_helper == 'lspsaga' then
  lsp_helper = {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      code_action ={
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
  local diagnostics = {}
  if settings.diagnostics == 'lsp_lines' then
    diagnostics = {
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      event = 'LspAttach',
      opts = {
        virtual_lines = {
          only_current_line = true
        }
      },
      config = function(_, opts)
        opts = vim.tbl_deep_extend('force', {virtual_text = false}, opts)
        vim.diagnostic.config(opts)
        require('lsp_lines').setup()
      end
    }
  elseif settings.diagnostics == 'diagflow' then
    diagnostics = {
      'dgagn/diagflow.nvim',
      event = 'LspAttach',
      config = true

    }
  end
  lsp_helper = { diagnostics,
    {
      'artemave/workspace-diagnostics.nvim'
    },
    {
      'hedyhli/outline.nvim',
      config = true,
      cmd = 'Outline',
      keys = {
        lazyKeyBind('<Tab>o', '<cmd>Outline<cr>', 'Symbol Outline')
      }
    },
    {
      'Bekaboo/dropbar.nvim',
      config = true,
      dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim', optional = true
      }
    },
    {
      'folke/trouble.nvim',
      config = true,
      cmd = 'Trouble',
      keys = {
        lazyKeyBind('<Tab>r', '<cmd>Trouble lsp_definitions focus=true<cr>', 'Definitions'),
        lazyKeyBind('<Tab>d', '<cmd>Trouble diagnostics focus=true<cr>', 'Diagnostics')
      }
    }
  }
end
return { lsp_helper,
  {
    'm-demare/hlargs.nvim',
    event = 'LspAttach',
    dependencies = { 'nvim-treesitter/nvim-treesitter', optional = true },
    config = true
  },
  {
    'luckasRanarison/clear-action.nvim',
    config = true,
    opts = {
      mappings = {
        code_action = { key = '<Tab>a', mode = { 'n' }, options = { desc = 'Code Action'} }
      }
    },
  }
}
