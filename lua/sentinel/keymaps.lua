-- Behaviour for 0 doesn't seem to get overriden when using vim.keymap.set
vim.api.nvim_set_keymap('n', '0', '0', { silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '00', '^', { silent = true, noremap = true})
