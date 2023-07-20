vim.g.mapleader = " "

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


-- copying to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- formatting
vim.keymap.set("n", "<leader>p", function() vim.lsp.buf.format() end)

-- make script executable
vim.keymap.set("n", "<leader>x", "<cmd> !chmod +x %<CR>")

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- window resizing
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<S-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<S-Left>", ":vertical resize +2<CR>")


