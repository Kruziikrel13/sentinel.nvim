local spec = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lua',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lsp-signature-help'
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
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<A-j>'] = cmp.mapping.select_next_item(),
        ['<A-k>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }) -- Select False won't auto select on <CR> unless explicitly selecting cmp entry
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }
      }, {
          { name = 'treesitter' }
        }),
      completion = {
        completeopt = 'menu,menuone,noselect,popup'
      }
    })
  end
}

if require('configuration').experimental.blink then
  spec = {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = "*",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      keymap = {
        ['<A-CR>'] = { 'select_and_accept' },
        [ '<Up>' ] = { 'select_prev' },
        [ '<A-k>' ] = { 'select_prev' },
        [ '<Down>' ] = { 'select_next' },
        [ '<A-j>' ] = { 'select_next' },
      },
    }
  }
end

return spec
