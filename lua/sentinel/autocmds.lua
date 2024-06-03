vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'  }, {
  pattern = '*',
  callback = function()
    vim.cmd.checktime()
  end
})
