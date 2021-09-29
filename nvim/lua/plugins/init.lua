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

-- local use = packer.use

---- recommandation
packer.reset()

-- setting up plugins
return packer.startup(function(use) 
  use {
    'wbthomason/packer.nvim',
    opt = false
  }

  -- utils
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'mattn/emmet-vim'

  -- color schemes
  use 'Mofiqul/dracula.nvim'
  use 'artanikin/vim-synthwave84'
  use 'shaunsingh/nord.nvim'
  use 'rose-pine/neovim'

  -- better syntax highlighting
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- fuzzy finder
  use {
       'nvim-telescope/telescope.nvim',
       requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- code completion / lsp
  use 'neovim/nvim-lspconfig' 
  use 'nvim-lua/completion-nvim'
  use 'glepnir/lspsaga.nvim'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- status line
  use 'hoob3rt/lualine.nvim'

  -- formatting
  use 'sbdchd/neoformat'
end
)
