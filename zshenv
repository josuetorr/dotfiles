
export ZSH=$HOME/.oh-my-zsh

export ANDROID_STUDIO_ROOT=/usr/local/android-studio
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export BROWSER="zen"

export TERMINAL="alacritty"

export EDITOR="nvim"

export XDG_CONFIG_HOME=$HOME/.config

export DOTFILES=$HOME/.dotfiles
export LOCAL_SRC=$HOME/.local/src
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_HTTPREPL_TELEMETRY_OPTOUT=true

export MYVIMRC=$DOTFILES/nvim/init.lua
export MYVIMRC_PARENT=$DOTFILES/nvim/

export GOPATH=$HOME/go/bin
export GOPATH_BIN=/usr/local/go/bin

export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:/$HOME/.dotnet/tools
export PATH=$PATH:/$HOME/.cargo/bin
export PATH=~/.config/npm-global/bin:$PATH
export PATH=$PATH:$DOTFILES/script
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/usr/bin
export PATH=$PATH:$GOPATH_BIN
export PATH=$PATH:$GOPATH
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

typeset -U path
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josue/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/josue/Downloads/google-cloud-sdk/path.zsh.inc'; fi
. "$HOME/.cargo/env"
