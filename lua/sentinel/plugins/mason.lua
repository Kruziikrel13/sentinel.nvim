return {
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
        optional = true,
        config = true,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'lua_ls' }
        },
        config = true,
        dependencies = { 'williamboman/mason.nvim' }
    }
}
