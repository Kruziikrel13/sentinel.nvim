local namespace = vim.api.nvim_create_namespace('sentinel_lsplines')

local M = {}

function M.setup()
  vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorMoved', 'CursorMovedI'}, {
    callback = function(args)

    end
  })

  vim.api.nvim_create_autocmd({'InsertEnter', 'FocusLost', 'BufLeave'}, {

  })
end

return M
