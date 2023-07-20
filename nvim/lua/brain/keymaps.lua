vim.g.mapleader = " "

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- window navigation
vim.keymap.set("n", "H", "<C-w>h")
vim.keymap.set("n", "J", "<C-w>j")
vim.keymap.set("n", "K", "<C-w>k")
vim.keymap.set("n", "L", "<C-w>l")
