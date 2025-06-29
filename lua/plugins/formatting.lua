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
        priority = 100,
        primary = true,
        format = function(buf)
          require('conform').format({ bufnr = buf })
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
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
