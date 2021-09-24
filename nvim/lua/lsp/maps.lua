local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  -- for more mappings, go to https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Space>p', ':Neoformat<CR>', opts)

  -- attach nvim-completion
  require'completion'.on_attach(client, bufnr)
end

-- Use a loop to conviently call 'setup' on multiple servers and 
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'stylelint_lsp' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounde_text_changes = 150
    }
  }
end
