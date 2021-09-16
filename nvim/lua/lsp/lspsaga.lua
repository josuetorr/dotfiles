-- vim.cmd[[
-- if !exists(g:loaded_lspsaga) | finish | endif
-- ]]

local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = 'round',
}
