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
          automatic_installation = true
        },
        config = true,
        dependencies = { 'williamboman/mason.nvim' }
    }
}
