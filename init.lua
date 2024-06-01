local settings = require('configuration')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = settings.mapleader
vim.g.maplocalleader = settings.maplocalleader

-- Entry point, during lazy loading it also executes the rest of our configuration files
require('sentinel')
