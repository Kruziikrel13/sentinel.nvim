local settings = require('configuration')
local lazyKeyBind = require('utils.keys').lazyKeyBind
local Plugins = require('utils.plugins')

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
  lsp_helper = {
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
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = function()
        vim.diagnostic.config({ virtual_text = false })
        require('lsp_lines').setup()
      end
    },
    {
      'DNLHC/glance.nvim',
      config = true,
      opts = {
        border = {
          enable = true,
        },
        mappings = {
          list = {
            ['<C-v>'] = function() require('glance').actions.jump_vsplit() end,
            ['<C-x>'] = function() require('glance').actions.jump_split() end,
          }
        },
        use_trouble_qf = Plugins.has('trouble.nvim')
      },
      dependencies = { 'folke/trouble.nvim', optional = true },
      keys = {
        lazyKeyBind('<Tab><Tab>', '<cmd>Glance definitions<cr>', 'Preview Definitions'),
        lazyKeyBind('<Tab>z', '<cmd>Glance implementations<cr>', 'Preview Implementations'),
        lazyKeyBind('<Tab>x', '<cmd>Glance references<cr>', 'Preview References'),
        lazyKeyBind('<Tab>t', '<cmd>Glance type_definitions<cr>', 'Preview Type Definitions'),
      }
    },
    {
      'Wansmer/symbol-usage.nvim',
      main = 'symbol-usage',
      event = 'BufReadPre',
      config = true
    },
    {
      'smjonas/inc-rename.nvim',
      main = 'inc_rename',
      config = true,
      keys = {
        lazyKeyBind('<Tab>r', '<cmd>IncRename<cr>', 'Incremental Rename')
      },
    },
    {
      'Bekaboo/dropbar.nvim',
      config = true,
      dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim', optional = true
      }
    }
    -- {
    --   'folke/trouble.nvim',
    --   config = true,
    --   cmd = 'Trouble',
    --   enabled = false
    -- },

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
