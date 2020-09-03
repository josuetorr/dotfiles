#  If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to jdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
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
export PATH=$PATH:~/android-studio/bin

# npm global PATH
export PATH=~/.config/npm-global/bin:$PATH

# Set firefox as default browser
export BROWSER="firefox"

# Set Terminal
export TERMINAL="st"

# set editor
export EDITOR="vim"

# Set home folder for config files
export XDG_CONFIG_HOME=$HOME/.config

typeset -U path
export PATH
