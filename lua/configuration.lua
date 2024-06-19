--- @class Settings
local conf = {}

conf.namespace = 'sentinel'

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '

conf.enable_startuptime = true
conf.enable_hardtime = false -- For enforcing good vim practices
conf.enable_freeze = false -- Freeze Code / Convert code selection to image


-- lspsaga | navigator | combined | none
conf.lsp_helper = 'combined'
--- lsp_lines | diagflow || Only applies to combined config
conf.diagnostics = 'lsp_lines'


conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

conf.mode = 'dark'

return conf
