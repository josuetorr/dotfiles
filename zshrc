# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"
eval "$(starship init zsh)"

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
alias nvimconfig="cd ~/.config/nvim"
alias tmuxconfig="vim ~/.tmux.conf"
alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias dl="cd ~/Downloads"
alias persweb="cd ~/Projects/personal-website"
alias dotfiles="cd ~/.dotfiles"
alias xresconfig="vim ~/.Xresources"
alias xsessconfig="vim ~/.xsession"
alias vifmconfig="vim ~/.config/vifm/vifmrc"
alias xinitconfig="vim ~/.xinitrc"
alias sxhkdconfig="vim ~/.config/sxhkd/sxhkdrc"
alias zprofileconfig="vim ~/.zprofile"
alias zenvconfig="vim ~/.zshenv"
alias g="git"
alias ga="git add"
alias ggraph="git log --all --oneline --decorate --graph"
alias gst="git status"
alias gac="git add . && git commit"
alias gd="git diff"
alias gp="git push"
alias nv="nvim"
alias nvpt="nvim --cmd 'set rtp+=.'"
alias ..="cd .."
alias mv="mv -i"
alias rm="rm -i"
alias love="/Applications/love.app/Contents/MacOS/love"
alias pn="pnpm"
alias l="exa -la --header --icons --git"
alias ls="exa"
alias luamake=/Users/brain/.dotfiles/lua-language-server/3rd/luamake/luamake
alias suckless="cd ${HOME}/.local/src/suckless"

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


[ -f "/Users/brain/.ghcup/env" ] && source "/Users/brain/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /Users/brain/.opam/opam-init/init.zsh ]] || source /Users/brain/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); 
for i in ${!paths[@]}; do 
if [[ ${paths[i]} == "''/Users/josue.torres/.pyenv/shims''" ]]; then unset '\''paths[i]'\''; 
fi; done; 
echo "${paths[*]}"')"
export PATH="/Users/josue.torres/.pyenv/shims:${PATH}"
export PYENV_SHELL=su
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/brain/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/brain/Library/Application Support/Herd/bin/":$PATH
