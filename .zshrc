export LANG=ja_JP.UTF-8

# tab補完
autoload -U compinit
compinit

# プロンプト設定
PROMPT="%/%% "
PROMPT2="%_%% "

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history   
