local M = {}

return {
  'stevearc/conform.nvim',
  lazy = true,
  cmd = 'ConformInfo',
  keys = {
    { '<leader>cF', function()
    end, mode = 'n', 'v', desc = 'Format Languages' }
  },
  init = function()
    Sentinel.on_very_lazy(function()
      Sentinel.format.register({
        name = 'conform.nvim',
        format = function(buf)
          require('conform').format({ bufnr = buf })
        end
      })
    end)
  end,
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_format = 'fallback'
    },
    formatters = {
      injected = { options = { ignore_errors = true } }
    }
  }
}
