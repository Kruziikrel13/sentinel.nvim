local lazyKeyBind = require('util').lazyKeyBind

return {
    {
        'nvim-tree/nvim-tree.lua',
        config = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            lazyKeyBind('t', '<cmd>NvimTreeToggle<cr>', 'Open Explorer'),
        }
    }
}