---@diagnostic disable: missing-fields, param-type-mismatch

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'petertriho/cmp-git',
      'FelipeLema/cmp-async-path'
    },

    config = function()
      vim.opt.completeopt = 'menu,menuone,noselect,popup'
      local cmp = require('cmp')

      cmp.setup({
        enabled = function()
          -- disable completion in comments
          local context = require('cmp.config.context')
          -- keep command mode completion enabled
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture('comment')
            and not context.in_syntax_group('Comment')
          end
        end,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        snippet = {
          expand = function(args)
             vim.snippet.expand(args.body)
              -- vim.fn["vsnip#anonymous"](args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<A-j>'] = cmp.mapping.select_next_item(),
          ['<A-k>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }) -- Select False won't auto select on <CR> unless explicitly selecting cmp entry
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, { name = 'buffer' }),
        completion = {
          completeopt = 'menu,menuone,noselect'
        }
      })
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
          matching = { disallow_symbol_nonprefix_matching = false }
      })
      require("cmp_git").setup()
    end
  }
}
