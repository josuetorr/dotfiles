local opt = {
	ignorecase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	undofile = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	number = true,
	relativenumber = true,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  cursorline = true,
}

vim.opt.shortmess:append "c"

for k,v in pairs(opt) do
	vim.opt[k] = v
end
