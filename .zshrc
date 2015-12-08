#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export DEFAULT_USER="vshen"

# Command mode bindings
bindkey -v
export KEYTIMEOUT=1

# User configuration
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"

export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export TERM=xterm-256color
export TODOTXT_DEFAULT_ACTION=ls

alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gpl='git pull'
alias gpu='git push'
alias gs='git status'
alias checkout='git checkout $(git branch | fzf-tmux --tac -d 15)'
alias tmux='tmux -2'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'

# alias for sudo
alias oops='sudo $(fc -ln -1)'

# alias for todo
alias t='todo.sh -d ~/todo.cfg'

# Fixing compiler for better Ctrlp-Vim matching
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Xdebug for sublime
export XDEBUG_CONFIG="idekey=sublime.xdebug"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -p ~/.agignore -g ""'
export FZF_DEFAULT_OPTS='-m -i'

export NVM_DIR="/Users/vshen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
