local packer = require 'packer'

packer.init {
--  opt_default = true, -- default to using opt (as opposed to start) plugins
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
		'wbthomason/packer.nvim'
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

  -- color schemes
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'

	-- status line
  use 'hoob3rt/lualine.nvim'

  -- better syntax highlighting
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

end
)
