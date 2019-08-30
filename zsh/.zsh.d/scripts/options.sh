unsetopt correctall
setopt +o nomatch
ulimit -S -n 2048

# Asdf
. $(brew --prefix asdf)/asdf.sh

# Tmuxinator
source ~/.config/tmuxinator/tmuxinator.zsh

if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi
