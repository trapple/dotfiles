alias ls='ls -Gla'
alias firefox='open -a Firefox'
alias ssh='ssh -o ServerAliveInterval=60'
alias rm='mv2trash'
alias vi='vim'

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

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

# plevn
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
alias plackup='plenv exec plackup --access-log=/dev/null'

#perl
function pmver() {
  [ -n "$1" ] && perl -e "use $1;print qq|$1: \$$1::VERSION\n|;"
}

# worksoace 
shopt -s dotglob
mybashfiles='/Users/trapple/.mybashrc/*.bashrc'
for bashrc in ${mybashfiles}
do
  source ${bashrc}
done
shopt -u dotglob
