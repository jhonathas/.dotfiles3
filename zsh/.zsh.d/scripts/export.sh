PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH

export EDITOR="nvim"

# if [[ "$(uname)" == "Darwin" ]]; then
#   export JAVA_HOME=$(/usr/libexec/java_home)
# fi

. ~/.asdf/plugins/java/set-java-home.sh


export PATH="/usr/local/sbin:$PATH"

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH=$(brew --prefix openssl)/bin:$PATH
fi


# Stow

export STOW_DIR=$HOME/.dotfiles

export HISTFILE=~/Dropbox/dotfiles/shell/.zsh_history
