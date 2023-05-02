local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Could not find 'packer'")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim")   -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

  -- Colorschemes
  use("rose-pine/neovim")
  use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
  use("ishan9299/modus-theme-vim")
  use("josuetorr/moonlight.nvim")
  --[[ use("dracula/vim") ]]
  use("Mofiqul/dracula.nvim")
  use("yonlu/omni.vim")
  use("NTBBloodbath/doom-one.nvim")
  use("shaunsingh/nord.nvim")
  use("marko-cerovac/material.nvim")
  use("rafamadriz/neon")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("nyoom-engineering/oxocarbon.nvim")

  -- bufferline (tabs)
  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

  -- colorizer
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- cmp plugins
  use("hrsh7th/nvim-cmp")        -- The completion plugin
  use("hrsh7th/cmp-buffer")      -- buffer completions
  use("hrsh7th/cmp-path")        -- path completions
  use("hrsh7th/cmp-cmdline")     -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip")            --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- emmet
  use("mattn/emmet-vim")

  -- LSP
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("mfussenegger/nvim-dap")
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  })

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")
  use("ahmedkhalf/project.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow")

  -- Comments
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring") -- jsx comments

  -- vim surround
  use("tpope/vim-surround")

  -- Git
  use("lewis6991/gitsigns.nvim")

  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-web-devicons" }
  })

  -- Buffers
  use("moll/vim-bbye")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- greeter (alpha)
  use("goolord/alpha-nvim")

  -- toggle terminals
  use("akinsho/toggleterm.nvim")

  -- personal plugin
  use("~/Projects/nvim-plugins/linerunner.vim")

  -- better motion
  use("easymotion/vim-easymotion")

  -- transparent
  use("xiyaowong/transparent.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
