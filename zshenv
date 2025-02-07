
export ZSH=$HOME/.oh-my-zsh

export ANDROID_STUDIO_ROOT=/usr/local/android-studio
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export BROWSER="librewolf"

export TERMINAL="st"

export EDITOR="nvim"

export XDG_CONFIG_HOME=$HOME/.config

export DOTFILES=$HOME/.dotfiles
export LOCAL_SRC=$HOME/.local/src
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_HTTPREPL_TELEMETRY_OPTOUT=true

export MYVIMRC=$DOTFILES/nvim/init.lua
export MYVIMRC_PARENT=$DOTFILES/nvim/

export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:/$HOME/.dotnet/tools
export PATH=$PATH:/$HOME/.cargo/bin
export PATH=~/.config/npm-global/bin:$PATH
export PATH=$PATH:~/.dotfiles/scripts
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/usr/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

typeset -U path
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josue/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/josue/Downloads/google-cloud-sdk/path.zsh.inc'; fi
. "$HOME/.cargo/env"
