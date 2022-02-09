local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- modes
-- * normal = 'n'
-- * insert = 'i'
-- * visual = 'v'
-- * visual block = 'x'
-- * term = 't'
-- * command = 'c'

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers (tabs)
keymap("n", "tk", ":bnext<CR>", opts)
keymap("n", "tj", ":bprevious<CR>", opts)
keymap("n", "td", ":Bdelete!<CR>", opts)

-- file tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", ":NvimTreeRefresh<Cr>", opts)
keymap("n", "<Leader>n", ":NvimTreeFindFile<Cr>", opts)

-- press jk fast to exit insert mode (not too sure about this keymap, but let's try it out)
keymap("i", "jk", "<ESC>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
if vim.fn.has("Darwin") then
	keymap("v", "∆", ":m .+1<CR>==", opts)
	keymap("v", "˚", ":m .-2<CR>==", opts)
	keymap("n", "∆", ":m .+1<CR>==", opts)
	keymap("n", "˚", ":m .-2<CR>==", opts)
else
	keymap("v", "<A-j>", ":m .-2<CR>==", opts)
	keymap("v", "<A-k>", ":m .-2<CR>==", opts)
	keymap("n", "<A-j>", ":m .-2<CR>==", opts)
	keymap("n", "<A-k>", ":m .-2<CR>==", opts)
end

-- Telescope (some commands replace the ones found in lsp/handler)
keymap("n", "<Leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>g", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>h", ":Telescope help_tags<CR>", opts)
keymap("n", "gR", ":Telescope lsp_references theme=ivy<CR>", opts)
keymap("n", "gd", ":Telescope lsp_definitions theme=ivy<CR>", opts)
keymap("n", "gi", ":Telescope lsp_implementations theme=ivy<CR>", opts)
keymap("n", "gx", ":Telescope lsp_code_actions theme=cursor<CR>", opts)
keymap("n", "gx", ":Telescope lsp_code_actions theme=cursor<CR>", opts)

-- formatting
keymap("n", "<Space>p", ":Format<cr>", opts)

-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- for developing plugins
function save_and_exec()
	if vim.bo.filetype == "vim" then
		vim.cmd(":silent! write")
		vim.cmd(":source %")
	elseif vim.bo.filetype == "lua" then
		vim.cmd(":silent! write")
		vim.cmd(":lua require('plenary.reload').reload_module'Linerunner'")
		vim.cmd(":luafile %")
	end
end

keymap("n", "<Leader><Leader>x", ":lua save_and_exec()<CR>", opts)
