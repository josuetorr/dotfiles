-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = {
  termguicolors = true,
  ignorecase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  undofile = true,
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  number = true,
  relativenumber = true,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  cursorline = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(opt) do
  vim.opt[k] = v
end
