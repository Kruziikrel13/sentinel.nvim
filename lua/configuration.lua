--- @class Settings
local conf = {}

conf.namespace = 'sentinel'

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '

conf.enable_startuptime = true
conf.enable_hardtime = false -- For enforcing good vim practices

conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

return conf
