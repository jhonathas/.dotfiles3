unsetopt correctall
setopt +o nomatch
ulimit -S -n 2048

# Asdf
if [[ "$(uname)" == "Darwin" ]]; then
. $(brew --prefix asdf)/asdf.sh
fi

# Tmuxinator
source ~/.config/tmuxinator/tmuxinator.zsh

export HISTFILE=~/.zsh_history

unset MAILCHECK # disable "you have mail" warning

os=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

# fzf (mac)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ "$(uname)" == "Darwin" ]]; then
  if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
  fi
fi

export LC_ALL=en_US.UTF-8

export EDITOR='nvim'
export STOW_DIR=$HOME/.dotfiles

if [[ "$os" == "Ubuntu" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ "$os" == "\"Manjaro Linux\"" ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

alert() {
  notify-send --icon=gtk-info Alert $1
}

