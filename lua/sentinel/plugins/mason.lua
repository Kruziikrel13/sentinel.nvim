return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
    optional = true,
    config = true,
  }
}
