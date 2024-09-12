--- @class Sentinel.Configuration
local conf = {}

conf.namespace = 'sentinel'

conf.root_patterns = { '.git' } -- patterns to search for root dir using

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '
conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

-- Optional Plugins
conf.plugins = {}
conf.plugins.startuptime = false -- startuptime monitoring
conf.plugins.fugit = false -- experimental git plugin
conf.plugins.hardtime = false -- enforces vim practices
conf.plugins.timespent = false -- tracks time spent across projects

-- Diagnostics Configuration
conf.diagnostics = {}
conf.diagnostics.line = 'tiny-inline' ---@type "lsp_lines" | "tiny-inline"
conf.diagnostics.actions = 'clear-action' ---@type "clear-action" | "tiny-action"

conf.theme = "github" ---@type "flow" | "github" | "serene"
conf.enable_transparency = false -- enables transparency if theme supports it
conf.mode = 'dark'

return conf
