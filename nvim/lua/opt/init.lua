local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local set = vim.opt

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

-- color scheme
g.colors_name = 'elflord'
g.syntax = true


-- cursor line
set.cursorline = true
