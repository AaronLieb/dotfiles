# [Read when interactive]
# See also: .zshenv .zprofile .zlogin

# Path
export PATH="~/.local/bin:$PATH"

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

#############
# Oh My Zsh #
#############

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugin list: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins
plugins=(git aws zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Oh My Posh
eval "$(oh-my-posh init zsh)"


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

###################
# Amazon Specific #
###################

source /Users/aarolieb/.brazil_completion/zsh_completion
eval "$(isengardcli shell-profile --keep-prompt)"

export AWS_ACCOUNT="767397721831"
export PATH="$HOME/.toolbox/bin:$PATH"
export GK_FRODINHO_MODE=1
export GK_FRODINHO_STATS=1
export GK_FRODINHO_BRAZIL_PATH="/Users/aarolieb/Code/frodinho/target/debug/amzn-brazil-path"
export GK_FRODINHO_SUPPORTED_RECIPES="name,namemajorversion,classpath,workspace-root"

alias bb="brazil-build"
alias brazil-recursive-cmd='brazil-recursive-cmd-parallel'
alias bbr="brazil-recursive-cmd-parallel"
alias bbrb="brazil-recursive-cmd-parallel brazil-build --allPackages"
alias bbc="brazil-build clean"
alias ws="brazil ws"
alias cdk="brazil-build cdk"
alias dev="ssh-add --apple-use-keychain -t 72000 && kitten ssh -Y dev-dsk-aarolieb-2c-272fe091.us-west-2.amazon.com -L 8080:localhost:8080 && tmux a"
alias oracle="ssh ubuntu@155.248.212.189 -i ~/.ssh/oracle.pem"
alias admin="ada credentials update --once --role=Admin --account"
alias ro="ada credentials update --once --role=ReadOnly --account"
alias timestamp="date -ujf '%Y-%m-%d %H:%M:%S' +%s "
alias ts="date -ujf '%Y-%m-%d %H:%M:%S' +%s "
alias ms="date -ujf '%Y-%m-%d %H:%M:%S' +%s000 "
alias prettyddb="jq '.Items[] | to_entries | map({(.key): .value | to_entries | .[0].value }) | add'"
alias sam="brazil-build-tool-exec sam"
alias mwinit="mwinit -f -s"

#############
# Better cd #
#############
eval "$(zoxide init --cmd cd zsh)"


#######################
# Custom Autocomplete #
#######################
source /Users/aarolieb/Code/goat/autocomplete/zsh_autocomplete

#############
# Languages #
#############

# Python Version Manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Ruby Version Manager
eval "$(rbenv init - zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Golang
export PATH="/opt/homebrew/opt/go@1.22/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
# fix for weird tesseract ocr bug
export LIBRARY_PATH="/opt/homebrew/lib"
export CPATH="/opt/homebrew/include"

# mise
eval "$(mise activate zsh)"

## dotfiles git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
