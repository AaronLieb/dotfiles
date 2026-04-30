# [Read when interactive]
# See also: .zshenv .zprofile .zlogin


# Uncomment to enable zsh startup profiling
# zmodload zsh/zprof

# Speeds up startup of compinit, only slow once a day
zstyle ':completion:*' menu yes select
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path
export PATH="~/.local/bin:$PATH"

#############
# Oh My Zsh #
#############

# speeds up startup
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugin list: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins
plugins=(
  git
  aws
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Oh My Posh
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

source /opt/homebrew/opt/gitstatus/gitstatus.prompt.zsh
source ~/.zunder-prompt.plugin.zsh
ZUNDER_PROMPT_CHAR_COLOR="red"    # default value: "fg"
ZUNDER_PROMPT_TOP_RIGHT_MODULES=("whoami")
ZUNDER_PROMPT_TOP_RIGHT_MODULE_CACHE=(0)
ZUNDER_PROMPT_TOP_RIGHT_MODULE_ASYNC=(0, 1)
ZUNDER_PROMPT_BOTTOM_RIGHT_MODULES=("echo '[\$(date +%H:%M:%S)]'")
ZUNDER_PROMPT_BOTTOM_RIGHT_MODULE_CACHE=() # which indices to cache on shell start-up
ZUNDER_PROMPT_BOTTOM_RIGHT_MODULE_ASYNC=() # which indices should be async

############
# Keybinds #
############

# edit commands with nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^ ' edit-command-line

# ctrl + r for fuzzy find command history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
alias v="nvim"
alias vim="nvim"
alias cat="bat"
alias lg="lazygit"
alias kiro="kiro-cli"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lgconfig='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'


[ -f ~/.zshrc.amazon ] && source ~/.zshrc.amazon

#############
# Better cd #
#############
eval "$(zoxide init --cmd cd zsh)"

#######################
# Custom Autocomplete #
#######################
# source /Users/aarolieb/Code/goat/autocomplete/zsh_autocomplete

#############
# Languages #
#############

# Python Version Manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Ruby Version Manager
# eval "$(rbenv init - zsh)"

# Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Golang
export PATH="/opt/homebrew/opt/go@1.22/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
# fix for weird tesseract ocr bug
export LIBRARY_PATH="/opt/homebrew/lib"
export CPATH="/opt/homebrew/include"

# mise
# eval "$(mise activate zsh)"

# Uncomment to enable zsh startup profiling
# zprof

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"
