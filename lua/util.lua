--- @class Utilities
local M = {}
local Util = require('lazy.core.util')
local settings = require('configuration')

--- @see https://github.com/doctorfree/nvim-lazyman
--- A large number of these functions are directly from here

--- @param plugin string
-- Check if plugin is installed
M.has = function(plugin)
    return require('lazy.core.config').plugins[plugin] ~= nil
end

--- @param mode mode
--- @param key string
--- @param cmd string | function
--- @param opts table?
-- Vim Keymap wrapper, we specify our own default opts if none are passed during call
M.map = function(mode, key, cmd, opts)
    local keys = require('lazy.core.handler').handlers.keys

    -- do not create keymap if lazy keys handler exists
    if keys ~= nil then
      if not keys.active[keys.parse({key, mode = mode}).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, key, cmd, opts)
      end
    end
end

M.isNotEmpty = function(var)
    return var ~= nil or var ~= '' or next(var)
end

M.isEmpty = function(var)
    return var == nil or var == '' or not next(var)
end

--- @param name string
--- @param namespace? string
-- Loads module / file with settings namespace prefixed (Can be overriden by manually specifying namespace)
M.load = function(name, namespace)
    local nspace = namespace or settings.namespace
    local mod = nspace .. '.' .. name
    Util.try(function()
        require(mod)
    end, {
        msg = 'Failed loading ' .. mod,
        on_error = function(msg)
            local modpath = require('lazy.core.cache').find('mod')
            if modpath then
                Util.error(msg)
            end
        end
    })
end

M.setup_lsp = function(lsp)
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  if type(lsp) == 'string' then
    require('lspconfig')[lsp].setup {
      capabilities = capabilities
    }
  end
end

--- @param fn function
-- Execute function on Very Lazy Event
M.on_very_lazy = function(fn)
    vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
            fn()
        end
    })
end

M.lazy_notify = function()
    local notifs = {}
    local function temp(...)
        table.insert(notifs, vim.F.pack_len(...))
    end

    local orig = vim.notify
    vim.notify = temp

    local timer = vim.uv.new_timer()
    local check = assert(vim.uv.new_check())

    local replay = function()
        timer:stop()
        check:stop()

        if vim.notify == temp then
            vim.notify = orig -- put back original notify if needed
        end
        vim.schedule(function()
            --- @diagnostic disable-next-line: no-unknown
            for _, notif in ipairs(notifs) do
                vim.notify(vim.F.unpack_len(notif))
            end
        end)
    end
    -- wait till vim.notify has been replaced
    check:start(function()
        if vim.notify ~= temp then
            replay()
        end
    end)
    -- or if it took more than 500ms, then something went wrong
    timer:start(500, 0, replay)
end

--- @param table table
--- @param key string
--- @return boolean
-- Check if key exists in table
M.table_contains = function(table, key)
    for entry, _ in pairs(table) do
        if entry == key then return true end
    end
    return false
end

--- @param key string
--- @param cmd string | function
--- @param description string
--- @return table
-- Wrapper for defining a key and returning it in a LazyVim readable format
M.lazyKeyBind = function(key, cmd, description)
    return { key, cmd, desc = description }
end

--- @param description string
--- @return table
-- Wrapper for defining a which key description group
M.whichKeyGroup = function(description)
    return { name = description }
end

return M

--- @alias mode "n" | "i" | "t" | "x" | "v"
