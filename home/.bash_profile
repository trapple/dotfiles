# .bash_profile

# Get the aliases and functions

# User specific environment and startup programs
PATH=$PATH:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=/usr/local/bin:$PATH
