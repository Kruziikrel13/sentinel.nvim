--- @class Settings
local conf = {}

conf.namespace = 'sentinel'

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '

conf.enable_startuptime = false -- startuptime monitoring
conf.enable_fugit = false -- fugit
conf.enable_hardtime = false -- For enforcing good vim practices

conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

conf.mode = 'dark' -- unused currently

return conf
