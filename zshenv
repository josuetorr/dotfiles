#  If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Path to homebrew
export PATH=/opt/homebrew/bin:$PATH

# Path to jdk
JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:$JAVA_HOME
# path+=(/usr/lib/jvm/java-11-openjdk-amd64)

# Path to SNAP
export SNAP=/snap/bin
export PATH=$PATH:$SNAP
# path+=(/snap/bin)

# Path to SableCC
export SABLECC=/home/josue/sablecc-3.7/bin
export PATH=$PATH:$SABLECC
# path+=(~/sablecc/destionation/bin)

# Path to personal scripts
export PATH=$PATH:~/.dotfiles/scripts

# Path to android studio
export ANDROID_STUDIO_ROOT=/usr/local/android-studio
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# npm global PATH
export PATH=~/.config/npm-global/bin:$PATH

# local bin
export PATH=$PATH:~/.local/bin

# Set default browser
export BROWSER="brave-browser"
# export BROWSER="firefox"

# Set Terminal
export TERMINAL="alacritty"

# set editor
export EDITOR="nvim"

# Set home folder for config files
export XDG_CONFIG_HOME=$HOME/.config

# Set dotfiles location
export DOTFILES=$HOME/.dotfiles

# Set vimrc path
export MYVIMRC=$DOTFILES/nvim/init.lua
export MYVIMRC_PARENT=$DOTFILES/nvim/

typeset -U path
export PATH
