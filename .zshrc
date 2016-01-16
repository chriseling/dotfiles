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

export PATH="/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export TERM=xterm-256color
export TODOTXT_DEFAULT_ACTION=ls

# alias vim to neovim
alias vim='nvim'

# git aliases
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gpl='git pull'
alias gpu='git push'
alias gs='git status'
alias tmux='tmux -2'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias ew='vim ~/.config/work.zsh'

# reload this config file
alias so='source ~/.zshrc'

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

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='locate "$PWD/"'
export FZF_DEFAULT_OPTS='
  -m -i
  --bind ctrl-d:page-down,ctrl-u:page-up
'
# git with FZF aliases
alias add='git add $(git diff --name-only HEAD | fzf-tmux --tac -d 15)'
alias checkout='git checkout $(git branch | fzf-tmux --tac -d 15)'
alias diff='git diff $(git diff --name-only HEAD | fzf-tmux --tac -d 15)'
alias show='git show --pretty="format:" $(git show --pretty="format:" --name-only | fzf-tmux --tac -d 15)'
alias undo='git checkout -- $(git diff --name-only HEAD | fzf-tmux --tac -d 15)'

# tmuxinator aliases
alias etu='cd ~/.tmuxinator; vim'
alias dtop='tmux attach-session -d -t desktop'
alias ltop='tmux attach-session -d -t laptop'
alias desktop='mux desktop && dtop'
alias laptop='mux laptop && ltop'

export ANDROID_HOME=/usr/local/opt/android-sdk

# source work specific config
source ~/.config/work.zsh
