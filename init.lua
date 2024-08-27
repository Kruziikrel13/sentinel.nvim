local configuration = require('configuration')

vim.loader.enable();

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = configuration.mapleader
vim.g.maplocalleader = configuration.maplocalleader

-- Entry point, during lazy loading it also executes the rest of our configuration files
require('loader')
