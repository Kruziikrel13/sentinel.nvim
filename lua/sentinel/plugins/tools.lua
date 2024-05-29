local settings = require('configuration')
local Util = require('util')

local startuptime = {}
if settings.enable_startuptime then
    -- measure startuptime
    startuptime = {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    }
end

local keymap_hints = {}
if settings.enable_keymap_hints then
    keymap_hints = {
        'tris203/hawtkeys.nvim',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        opts = function()
            local customMaps = {}
            if Util.has('which-key') then
                customMaps = {
                    ['wk.register'] = {
                        method = 'which_key'
                    }
                }
            else
                customMaps = {
                    ['lazy'] = {
                        method = 'lazy'
                    }
                }
            end
            return {
                customMaps = customMaps
            }
        end,
        config = true,
    }
end
return {
    startuptime,
    keymap_hints
}
