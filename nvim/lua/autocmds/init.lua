local autocmds = require('utils/autocmd')

local MYVIMRC_PARENT = vim.env.MYVIMRC_PARENT

-- source init.lua when changing a file in nvim's config
local reload_vimrc_cmd = 'so % | echom "Reloaded nvim"'
autocmds.augroup {
  group = 'reload_vimrc',
  autocmds = {
    { event = 'BufWritePost', pattern = MYVIMRC_PARENT .. '*', cmd = reload_vimrc_cmd},
  },
}
