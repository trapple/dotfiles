alias ls='ls -Gla'

export LSCOLORS=gxfxcxdxbxegedabagacad
export SVN_EDITOR="vim";
export PERL_CPANM_OPT="--local-lib=~/perl5";
export PERL_LOCAL_LIB_ROOT="/Users/trapple/perl5";
export PERL_MB_OPT="--install_base /Users/trapple/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/trapple/perl5";
export PERL5LIB="/Users/trapple/perl5/lib/perl5/darwin-thread-multi-2level:/Users/trapple/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/trapple/perl5/bin:$PATH";

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH";
export CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)";

if which plenv > /dev/null; then eval "$(plenv init -)"; fi
export PATH=/usr/local/bin:$PATH;

