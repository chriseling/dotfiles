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
export FSEM=~/dotfiles/fs-easymotion
source $FSEM/easycd.sh
source $FSEM/easygrep.sh
source $FSEM/easyfind.sh

alias u='easyCdUp'
alias f='easyFind'
alias ff='easyFindOpen'
alias g='easyGrep'
alias gg='easyGrepOpen'

export EASYCD_REPLACE_FIRST_CHAR=0

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
export FZF_DEFAULT_COMMAND='ag -g "" -p ~/.agignore'
export FZF_DEFAULT_OPTS='-m -i'
#-----------------------------BOX SPECIFIC CONFIG-----------------------------
# alias for box root directory
alias c='cd /box/www/current_local'
alias p='cd ~/performance'
alias pt='cd ~/performance/tombstones-memorialist'
alias pb='cd ~/performance/brainy'

# work aliases
alias wsy='work sync'
alias wsa='work save'
alias wr='~/review.sh'
alias wt='work test'
alias wo='work --no-limit'
alias dev='git checkout v5-dev && git pull && wsy'

# add devtools to PATH
export PATH=/box/www/devtools_readonly/bin:$PATH
ulimit -n 2560
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
