alias cl="clear"
alias ll="/bin/ls -l"
alias lf="/bin/ls -F"
alias la="/bin/ls -a"
alias ls="ls -Gla"
alias firefox='open -a Firefox'
alias ssh='ssh -o ServerAliveInterval=60'

# enviroment
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad

# tab補完
autoload -U compinit
compinit

# プロンプト設定
PROMPT="%C%% "
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

# キーバインドをvimに
# bindkey -v

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
alias vi='/usr/local/bin/vim'
export TERM=xterm-256color
export EDITOR='/usr/local/bin/vim'

# subversion
export SVN_EDITOR='vim -c "set fenc=utf-8"'

# homebrew
export PATH=/usr/local/bin:$PATH
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

#peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#pcd(peco-cd)
PECO_CD_FILE=$HOME/.peco/.peco-cd #お気に入りを記録するファイル
function pcd() {
  if [ $1 ]; then
    if [ $1 = "add" ]; then
      if [ $2 ]; then
        ADD_DIR=$2
        if [ $2 = "." ]; then
          ADD_DIR=$(pwd) 
        fi
        echo "add $ADD_DIR to $PECO_CD_FILE"
        echo $ADD_DIR >> $PECO_CD_FILE
      fi
    elif [ $1 = "edit" ]; then
      if [ $EDITOR ]; then
        $EDITOR $PECO_CD_FILE
      fi
    fi
  else
    cd $(cat $PECO_CD_FILE | peco)
  fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
