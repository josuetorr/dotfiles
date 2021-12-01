#!/bin/sh

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# update nvim to nightly release to work with telescope
brew unlink neovim
brew install --HEAD neovim

# install language servers
npm install -g typescript typescript-language-server
# eslint
npm i -g stylelint-lsp
#prettier
npm i -g prettier
# lua package manager
brew install luarocks
# lua formatter
luarocks install --server=https://luarocks.org/dev luaformatter
# python formatter
brew install black
