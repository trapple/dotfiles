alias cl="clear"
alias ll="/bin/ls -Gl"
alias lf="/bin/ls -F"
alias la="/bin/ls -a"
alias ssh='ssh -o ServerAliveInterval=60'
alias :q='exit' 

# ls color
if [[ $OSTYPE =~ ^darwin ]]; then
  alias ls='ls -G'
elif [[ $OSTYPE =~ ^linux ]]; then
  alias ls='ls --color'
fi


# ~/local/bin
export PATH=$HOME/local/bin:$PATH

# fpath
fpath=($HOME/.zsh/func $fpath)

# enviroment
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad

# tab補完
autoload -U compinit
compinit

# プロンプト設定
source ~/.zsh/git-prompt.sh
setopt PROMPT_SUBST
PROMPT='%F{3}%c%f%F{1}$(__git_ps1 " (%s)")%f%F{3} %%%f '
PROMPT2="%_%% "

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history   
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey -e
export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>"

# dir名を打つだけで移動する
setopt auto_cd
# dirの移動を記録して使う
setopt auto_pushd
# コマンド名の修正
setopt correct
# 補完リストを詰めて表示
setopt list_packed
# no beep
setopt nolistbeep

# vim
alias vi=/usr/local/bin/vim
export TERM=xterm-256color
export EDITOR=/usr/local/bin/vim

# subversion
export SVN_EDITOR='vim -c "set fenc=utf-8"'

#perl
alias perldoc="perldoc -M Pod::Text::Color::Delight"
function pmver() {
  [ -n "$1" ] && perl -e "use $1;print qq|$1: \$$1::VERSION\n|;"
}
alias reply="PERL_RL=Caroline reply"

#peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    awk '!a[$0]++' | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^r' peco-select-history

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#pcd(peco-cd)
autoload -Uz pcd

# Macのみ
if [[ $OSTYPE =~ ^darwin ]]; then

  alias updatedb='sudo /usr/libexec/locate.updatedb'
  alias firefox='open -a Firefox'

  # homebrew
  export CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)"

  # boot2docker
  export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

  #vim+peco
  function vip() {
    if [ $1 -a $1 = "." ]; then
      RET=$(mdfind -onlyin ./ -name $1 | egrep -v "node_modules|bower_components" | sed "s#$(pwd)/##g" | peco)    
    elif [ $1 ]; then
      RET=$(mdfind -onlyin ~/ -name $1 | peco --query $1)    
    fi
    if [ $RET ]; then
      vi $RET
    fi
  }
fi

# color diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi
alias diffy='diff -y --suppress-common-lines'

# Trash
alias rm="trash"
autoload -Uz trash

# phpbrew
source ~/.phpbrew/bashrc

# composer global
export PATH=~/.composer/vendor/bin/:$PATH

# golang
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
autoload -Uz phq

# The next line updates PATH for the Google Cloud SDK.
source '/Users/trapple/Applications/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/trapple/Applications/google-cloud-sdk/completion.zsh.inc'

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# direnv
eval "$(direnv hook zsh)"
