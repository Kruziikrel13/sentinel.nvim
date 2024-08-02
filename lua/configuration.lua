--- @class Settings
local conf = {}

conf.namespace = 'sentinel'

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '

-- Plugins
conf.enable_startuptime = false -- startuptime monitoring
conf.enable_fugit = false -- experimental git plugin
conf.enable_hardtime = false -- For enforcing good vim practices
conf.enable_timespent = true

---@type "lsp_lines" | "tiny-inline"
conf.line_diagnostics = 'lsp_lines'

---@type "clear-action" | "tiny-action"
conf.lsp_actions = 'clear-action'

conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

---@type "flow" | "github"
conf.theme = "github"
conf.enable_transparency = false -- enables transparency if theme supports it
conf.mode = 'dark'

return conf
