local handlers = {
  function(server_name)
    require('lspconfig')[server_name].setup{}
  end
}
require('mason').setup()
require('mason-lspconfig').setup({ handlers = handlers })
