vim.keymap.set('n', '00', '^', { silent = true })
vim.keymap.set('n', '0', '0', { silent = true })

vim.keymap.set('n', '<leader>xt', function()
  require('helpers.templates').writeTemplate()
end, { silent = true, desc = "Generate Template" })
