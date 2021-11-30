-- installing packer after cloning
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	execute 'packadd packer.nvim'
end

-- general options
require 'opt'

-- keymaps
require 'keymaps'

-- plugins
require 'plugins'
require 'plugins/lualine'
require 'plugins/treesitter'

-- code completion
require 'lsp/lspsaga'
require 'lsp/cmp-config'
