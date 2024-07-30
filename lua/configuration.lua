--- @class Settings
local conf = {}

conf.namespace = 'sentinel'

-- Leader Keys
conf.mapleader = ' '
conf.maplocalleader = ' '

conf.enable_startuptime = false -- startuptime monitoring
conf.enable_fugit = false -- fugit
conf.enable_hardtime = false -- For enforcing good vim practices

---@type "lsp_lines" | "tiny-inline"
conf.line_diagnostics = 'lsp_lines'

---@type "clear-action" | "tiny-action"
conf.lsp_actions = 'clear-action'

conf.init_file_loading = false -- load .nvim.lua init files (note: we already auto load .lazy.lua files)

conf.mode = 'dark' -- unused currently

return conf
