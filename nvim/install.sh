#!/bin/sh

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# update nvim to nightly release to work with telescope
# brew unlink neovim
# brew install --HEAD neovim

# install language servers

# typescript
npm install -g typescript typescript-language-server
# eslint
npm i -g stylelint-lsp
