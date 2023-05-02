local M = require("user.lsp.handlers")
local handlers = {
  function(server_name)
    require('lspconfig')[server_name].setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities
    })
  end
}
require('mason').setup()
require('mason-lspconfig').setup({ handlers = handlers })
