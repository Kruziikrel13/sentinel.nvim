--- @class Sentinel.Configuration
local conf = {}

conf.namespace = 'sentinel'

conf.root_patterns = { '.git', 'index.html', 'compile_commands.json' } -- patterns to search for root dir using

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '
conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

-- Optional Plugins
conf.plugins = {}
conf.plugins.fugit = false -- experimental git plugin

-- Diagnostics Configuration
conf.diagnostics = {}
conf.diagnostics.line = 'tiny-inline' ---@type "lsp_lines" | "tiny-inline"
conf.diagnostics.actions = 'clear-action' ---@type "clear-action" | "tiny-action"

-- Theme Configuration
conf.theme = {}
conf.theme.preset = "github" ---@type "flow" | "github" | "serene"
conf.theme.transparency = false -- enables transparency if theme supports it
conf.theme.mode = 'dark'

conf.experimental = {}
conf.experimental.blink = true -- use blink for completions instead of cmp
conf.experimental.trouble = false -- use trouble for quickfixes

return conf
