local opt = {
	backup = false,				                  -- creates a backup file
	clipboard = "unnamedplus", 		          -- allows neovim to acces system clipboard
	cmdheight = 2, 				                  -- more space in neovim cmd line for displaying msg
	completeopt = { 'menuone', 'noselect' },-- mostly just for cmp
	conceallevel = 0, 			                -- so that `` is visible in .md files
	fileencoding = "utf-8", 		            -- encoding written to a file
	hlsearch = true,			                  -- highlight when searching
	ignorecase = true,			                -- ignore case when searching
	mouse = "a",				                    -- allow mouse control
	pumheight = 10,				                  -- popup menu height
	showmode = true,			                  -- shows vim mode
	showtabline = 2,			                  -- always show tabs
	smartcase = true,			                  -- smart case
	smartindent = true,			                -- make indenting smart again
	splitbelow = true,			                -- force all horizontal splits to go below current
	splitright = true,			                -- force all vertical splits to go to the right of current
	swapfile = false,			                  -- creates a swapfile
  termguicolors = true,			            -- set term gui colors
	timeoutlen = 1000,			                -- time to wait for a mapped sequence to complete (in ms)
	undofile = true,			                  -- enable persistent undo
	updatetime = 300,			                  -- faster completion (4000ms default)
	writebackup = false,	               		-- if file is being edited by another program, it is not allowed to be edited
	expandtab = true,			                  -- convert tabs to spaces
	shiftwidth = 2,				                  -- the number of spaces inserted for each indentation
	tabstop = 2,				                    -- insert two spaces for tab
	cursorline = true,	                		-- show cursor line
	number = true,			                   	-- show number line
	relativenumber = true,            			-- use relative number lines
	numberwidth = 2,			                  -- set number column width to 2 (default 4)
	signcolumn = "yes",			                -- always show sign column, otherwise it would shift to text each time
	wrap = false,				                    -- whether lines will wrap or not
	scrolloff = 8,				                  -- awesome feature!
	sidescrolloff = 8,
	guifont = "monospace:h17",		          -- font used in gui nvim apps
}

vim.opt.shortmess:append "c"

for k,v in pairs(opt) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
