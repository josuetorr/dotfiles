require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'scss',
    'html',
    'lua',
    'json',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true }
}
