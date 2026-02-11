local opt = {
	termguicolors = true,
	ignorecase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	undofile = true,
	smoothscroll = true,
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
vim.o.winborder = "solid"
for k, v in pairs(opt) do
	vim.opt[k] = v
end
