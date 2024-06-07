local Util = require('util')

local function lua_ls()
  local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())
  require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        workspace = {
          library = { vim.env.VIMRUNTIME }
        }
      }
    }
  })
end

lua_ls()

return {}
