--[[
-- strucuture of keybing:
-- 	mode, binding, mapto, options
--]]
local keymap = vim.api.nvim_set_keymap

-- moving between buffers
local opts = { noremap = true }
keymap('n', '<C-j>', '<c-w>j',opts)
keymap('n', '<C-h>', '<c-w>h',opts)
keymap('n', '<C-k>', '<c-w>k',opts)
keymap('n', '<C-l>', '<c-w>l',opts)

-- adjusting buffer view size 
keymap('n', '<C-]>', '<C-w>-',opts)
keymap('n', '<C-[>', '<C-w>+',opts)
keymap('n', '<C-i>', '<C-w><',opts)
keymap('n', '<C-p>', '<C-w>>',opts)

-- tabs
keymap('n', 'tn', ':tabnew<Space>',opts)
keymap('n', 'th', ':tabfirst<CR>',opts)
keymap('n', 'tj', ':tabprev<CR>',opts)
keymap('n', 'tk', ':tabnext<CR>',opts)
keymap('n', 'tl', ':tablast<CR>',opts)
