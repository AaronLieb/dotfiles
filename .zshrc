# [Read when interactive]
# See also: .zshenv .zprofile .zlogin

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

####################
# Version Managers #
####################

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


#############
# Oh My Zsh #
#############

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugin list: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins
plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# Power level 10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# MacOS notify command
if [[ $(uname) == "Darwin" ]]; then
  function notify {
    if [ $? -eq 0 ]; then
      osascript -e 'display notification "The command succeeded" with title "Success" sound name "Funk"'
    else
      osascript -e 'display notification "The command failed" with title "Failed" sound name "Bottle"'
    fi
  }
fi

###################
# Amazon Specific #
###################

source /Users/aarolieb/.brazil_completion/zsh_completion

export AWS_ACCOUNT="767397721831"
export PATH="$HOME/.toolbox/bin:$PATH"
export PATH=$HOME/Code/CWLS/src/CWLS/build/bin:$PATH

alias bb="brazil-build"
alias bbr="brazil-recursive-cmd"
alias bbrb="brazil-recursive-cmd brazil-build --allPackages"
alias bbrc="brazil-recursive-cmd brazil-build clean --allPackages"
alias bbc="brazil-build clean"
alias ws="brazil ws"
alias cdk="brazil-build cdk"
alias dev="ssh-add --apple-use-keychain -t 72000 && ssh dev-dsk-aarolieb-2c-272fe091.us-west-2.amazon.com"

##############
# Better cd  #
##############
eval "$(zoxide init --cmd cd zsh)"
