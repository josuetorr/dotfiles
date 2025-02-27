vim.g.mapleader = " "

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- copying to clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- make script executable
vim.keymap.set("n", "<leader>x", "<cmd> !chmod +x %<CR>", { desc = "make file executable" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalize width" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close pane" })

-- window resizing
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<S-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<S-Left>", ":vertical resize +2<CR>")

vim.keymap.set("n", ";", ":")
