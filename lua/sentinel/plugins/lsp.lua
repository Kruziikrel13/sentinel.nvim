local lazyKeyBind = require('util').lazyKeyBind

return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'nvimdev/lspsaga.nvim',
            { 'folke/neodev.nvim', opts = {} },
        },
        config = function()
            require('neodev').setup()
            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup {}
                end
            })
        end
    },
    {
        'folke/neodev.nvim',
        version = false,
        event = "VeryLazy",
        optional = true
    },
    {
        'zeioth/garbage-day.nvim',
        event = 'VeryLazy',
        config = true,
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'j-hui/fidget.nvim',
        config = true,
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'nvimdev/lspsaga.nvim',
        config = true,
        keys = {
            lazyKeyBind('<Tab>d', '<cmd>Lspsaga goto_definition<cr>', 'Goto Definition'),
            lazyKeyBind('<Tab>r', '<cmd>Lspsaga rename ++project<cr>', 'Rename Symbol'),
            lazyKeyBind('<Tab>a', '<cmd>Lspsaga code_action<cr>', 'Code Actions')
        }
    }
}
