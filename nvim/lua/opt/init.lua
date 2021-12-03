local g = vim.g
local wo = vim.wo
local set = vim.opt
local o = vim.o
local cmd = vim.cmd

-- basic options
vim.wo.relativenumber = true

-- tabs
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- show relative numbers
set.number = true
set.relativenumber = true

-- splits settings
o.splitbelow = true
o.splitright = true

-- true color
o.termguicolors = true

set.cursorline = true

-- mouse control
set.mouse = 'a'

-- colorscheme
cmd('colorscheme moonlight')
