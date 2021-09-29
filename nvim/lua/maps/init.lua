--[[
-- strucuture of keybing:
-- 	mode, binding, cmd, options
--]]
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }
local opts_silent = { noremap = true, silent = true }
-- moving between buffers
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

-- fuzzy finder 
keymap('n', '<Leader>f', ':Telescope find_files<CR>', opts)
keymap('n', '<Leader>g', ':Telescope live_grep<CR>', opts)

-- file explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<Cr>', opts)
keymap('n', '<Leader>r', ':NvimTreeRefresh<Cr>', opts)
keymap('n', '<Leader>n', ':NvimTreeFindFile<Cr>', opts)

-- selecting from autocompletion
vim.cmd [[
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-j>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-k>" : "\<S-Tab>"
]]

-- lspsaga disgnostics
keymap('n', '<C-n>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts_silent)
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts_silent)
keymap('i', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts_silent)
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts_silent)

-- toogle rose-pine theme
keymap('n', '<C-n>', [[<cmd> lua require('rose-pine.functions').toggle_variant({'moon', 'base'})<cr>]], opts_silent)
