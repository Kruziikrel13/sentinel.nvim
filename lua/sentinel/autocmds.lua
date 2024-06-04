local Util = require('util')

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'  }, {
  pattern = '*',
  callback = function()
    vim.cmd.checktime()
  end
})

if Util.has('auto-session') and Util.has('nvim-tree') then
  vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = 'NvimTree*',
    callback = function()
      local api = require('nvim-tree.api')
      local view = require('nvim-tree.view')

      if not view.is_visible() then
        api.tree.open()
      end
    end
  })
end
