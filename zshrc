# #  If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# # Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# # Path to jdk
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# export PATH=$PATH:$JAVA_HOME
# # path+=(/usr/lib/jvm/java-11-openjdk-amd64)

# # Path to SNAP
# export SNAP=/snap/bin
# export PATH=$PATH:$SNAP
# # path+=(/snap/bin)

# # Path to SableCC
# export SABLECC=/home/josue/sablecc/destination/bin
# export PATH=$PATH:$SABLECC
# # path+=(~/sablecc/destionation/bin)

# # Path to personal scripts
# export PATH=$PATH:~/.dotfiles/scripts

# typeset -U path
# export PATH

 
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# figlet -f bubble "LIVE HERE AND NOW" | lolcat
livehereandnow | lolcat

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    node 
    npm 
    tmux
    zsh-syntax-highlighting
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim='nvim'
alias i3config="vim ~/.config/i3/config"
alias i3blocksconfig="vim ~/.config/i3blocks/config"
alias zshconfig="vim ~/.zshrc"
alias bashconfig="vim ~/.bashrc"
alias nvimconfig="vim ~/.dotfiles/init.vim"
alias tmuxconfig="vim ~/.tmux.conf"
alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias DL="cd ~/Downloads"
alias persweb="cd ~/Projects/personal-website"
alias uqamAi="cd ~/School/2020/ai"
alias uqamAlgo="cd ~/School/2020/algo"
alias uqamLang="cd ~/School/2020/lang"
alias uqamArch="cd ~/School/2020/architecture"
alias dotfiles="cd ~/.dotfiles"
alias xresconfig="vim ~/.Xresources"
alias xsessconfig="vim ~/.xsession"
alias vifmconfig="vim ~/.config/vifm/vifmrc"
alias xinitconfig="vim ~/.xinitrc"
alias sxhkdconfig="vim ~/.config/sxhkd/sxhkdrc"
alias zprofileconfig="vim ~/.dotfiles/zprofile"
alias zenvconfig="vim ~/.dotfiles/zshenv"
alias ggraph="git log --all --oneline --decorate --graph"
alias gst="git status"
alias nv="nvim"
alias ..="cd .."
alias mv="mv -i"
alias rm="rm -i"
alias l="ls -lAh"
# alias cd="cd && ls"
#

# Spaceship theme settings
# SPACESHIP_CHAR_SYMBOL=" :: "
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_HOST_SHOW=true
SPACESHIP_VI_MODE_INSERT=""
SPACESHIP_VI_MODE_NORMAL="(N)"

# zsh-syntax-highlighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
setopt +o nomatch

# Vi binding
bindkey -v
# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
   if [[ ${KEYMAP} == vicmd ]] ||
      [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

# Use beam shape cursor on startup.
# echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
    echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
# preexec() {
#     echo -ne '\e[5 q'
# }
