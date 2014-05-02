alias rm='mv2trash'
alias firefox='open -a Firefox'

# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)"
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
