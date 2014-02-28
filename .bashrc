alias ls='ls -Gla'
alias cl='clear'
alias firefox='open -a Firefox'
alias ssh='ssh -o ServerAliveInterval=60'
alias rm='mv2trash'

# vim
alias vi='vim'
export TERM=xterm-256color

# bash
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTCONTROL=ignorespace
export HISTIGNORE="cd*:ls*"
# unix commands 
export LSCOLORS=gxfxcxdxbxegedabagacad

# subversion
export SVN_EDITOR='vim -c "set fenc=utf-8"'

# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)"
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

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

