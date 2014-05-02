alias cl='clear'
alias ssh='ssh -o ServerAliveInterval=60'

# ls color
if [[ $OSTYPE =~ ^darwin ]]; then
  alias ls='ls -Gla'
elif [[ $OSTYPE =~ ^linux ]]; then
  alias ls='ls -la --color'
fi

# vim
alias vi='vim'
export TERM=xterm-256color

# bash
export LANG=ja_JP.UTF-8
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTCONTROL=ignorespace
export HISTIGNORE="cd*:ls*"
# unix commands 
export LSCOLORS=gxfxcxdxbxegedabagacad

# set prompt
PS1="\w $ "

# subversion
export SVN_EDITOR='vim -c "set fenc=utf-8"'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

# plenv
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
alias plackup='plenv exec plackup --access-log=/dev/null'

#perl
alias perldoc="perldoc -M Pod::Text::Color::Delight"
function pmver() {
  [ -n "$1" ] && perl -e "use $1;print qq|$1: \$$1::VERSION\n|;"
}

# local setting
shopt -s dotglob
bashlocal="$HOME/.bash_local/*.bashrc"
for bashrc in ${bashlocal}
do
  source ${bashrc}
done
shopt -u dotglob
