---@diagnostic disable: missing-fields, param-type-mismatch

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      -- 'hrsh7th/cmp-vsnip',
      -- 'hrsh7th/vim-vsnip',
      'petertriho/cmp-git',
      'FelipeLema/cmp-async-path'
    },

    config = function()
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
        snippet = {
          expand = function(args)
             vim.snippet.expand(args.body)
              -- vim.fn["vsnip#anonymous"](args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<A-j>'] = cmp.mapping.select_next_item(),
          ['<A-k>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }
        }, { name = 'buffer' }),
      })
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })
      require("cmp_git").setup()
    end
  }
}
