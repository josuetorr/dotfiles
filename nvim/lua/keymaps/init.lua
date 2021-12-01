local keymap = vim.api.nvim_set_keymap
local opts_silent = { silent = true, noremap = true }
local opts = { noremap = true }

-- window switching
keymap('n', '<c-j>', '<c-w>j', opts_silent)
keymap('n', '<c-h>', '<c-w>h', opts_silent)
keymap('n', '<c-k>', '<c-w>k', opts_silent)
keymap('n', '<c-l>', '<c-w>l', opts_silent)

-- adjusting buffer view size
keymap('n', '<C-]>', '<C-w>-', opts_silent)
keymap('n', '<C-[>', '<C-w>+', opts_silent)
keymap('n', '<C-i>', '<C-w><', opts_silent)
keymap('n', '<C-p>', '<C-w>>', opts_silent)

-- tabs
keymap('n', 'tn', ':tabnew<Space>', opts)
keymap('n', 'th', ':tabfirst<CR>', opts)
keymap('n', 'tj', ':tabprev<CR>', opts)
keymap('n', 'tk', ':tabnext<CR>', opts)
keymap('n', 'tl', ':tablast<CR>', opts)

-- file explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<Cr>', opts_silent)
keymap('n', '<Leader>r', ':NvimTreeRefresh<Cr>', opts_silent)
keymap('n', '<Leader>n', ':NvimTreeFindFile<Cr>', opts)

-- fuzzy finder 
keymap('n', '<Leader>f', ':Telescope find_files<CR>', opts_silent)
keymap('n', '<Leader>g', ':Telescope live_grep<CR>', opts_silent)

-- lspsaga 
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts_silent)
keymap('n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts_silent)
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts_silent)
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', opts_silent)
keymap('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts_silent)
keymap('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts_silent)
keymap('n', 'gx', '<cmd>Lspsaga code_action<CR>', opts_silent)
keymap('n', 'gs', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts_silent)

-- format file
keymap('n', '<Space>p', ':Format<CR>', opts_silent)
