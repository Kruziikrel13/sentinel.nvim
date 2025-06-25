vim.uv = vim.uv or vim.loop

opts = {
  colorscheme = 'cyberdream'
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy').setup(opts)
