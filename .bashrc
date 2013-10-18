alias ls='ls -Gla';
alias firefox='open -a Firefox';
alias ssh='ssh -o ServerAliveInterval=60';
alias rm='mv2trash';

export LSCOLORS=gxfxcxdxbxegedabagacad
export SVN_EDITOR='vim -c "set fenc=utf-8"';

export CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)";

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH";

if which plenv > /dev/null; then eval "$(plenv init -)"; fi
alias plackup='plenv exec plackup --access-log=/dev/null';

export PATH=/usr/local/sbin:/usr/local/bin:$PATH;

function pmver() {
  [ -n "$1" ] && perl -e "use $1;print qq|$1: \$$1::VERSION\n|;";
}
