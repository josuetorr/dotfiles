-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- TreeSitter
  use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }})
  use("nvim-treesitter/playground")


  -- harpoon for navigation
  use("theprimeagen/harpoon")

  use("mbbill/undotree")

  use("tpope/vim-fugitive")

end)
