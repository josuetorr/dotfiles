-- automatically install and set up packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require 'packer'

packer.init {
  --opt_default = true, -- default to using opt (as opposed to start) plugins
  display = {
    open_fn = require('packer.util').float, -- open window as floating
    working_sym = '🛠', -- symbol for a plugin being installed/updated
    error_sym = '❌', -- symbol for errors
    done_sym = '👏', -- symbol when a plugin has finished installing/updating
    remove_sym = '💣', -- symbol for removing a plugin
    moved_sym = '🚀', -- symbol for a plugin which has moved (e.g. from opt to start)
    header_sym = '-', -- symbol for the header line in packer's display
    show_all_info = true, -- verbose output
    prompt_border = 'double' -- border style for prompt
  }
}

-- recommendation
packer.reset()

return packer.startup(function(use)
	use {
		'wbthomason/packer.nvim',
    opt = false,
	}

	-- utils
  	use 'tpope/vim-surround'
  	use 'tpope/vim-commentary'
  	use 'mattn/emmet-vim'

	-- file explorer
  	use {
    		'kyazdani42/nvim-tree.lua',
    		requires = 'kyazdani42/nvim-web-devicons',
    		config = function() require'nvim-tree'.setup {} end
  	}

  -- lsp
  use 'tami5/lspsaga.nvim'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- fuzzy finder
  use {
       'nvim-telescope/telescope.nvim',
       requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- code formatter
  use 'lukas-reineke/format.nvim'

  -- color schemes
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'
  use 'shaunsingh/moonlight.nvim'

	-- status line
  use 'hoob3rt/lualine.nvim'

  -- better syntax highlighting
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

   -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end
)
