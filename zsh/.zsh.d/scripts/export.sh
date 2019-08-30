PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH

export EDITOR="nvim"

# brew/cask
# export HOMEBREW_CASK_OPTS="--caskroom=~/Applications"

# IONIC / CORDOVA
export JAVA_HOME=$(/usr/libexec/java_home)

# Using Android Studio path
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH="/usr/local/sbin:$PATH"

export PATH=$(brew --prefix openssl)/bin:$PATH

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# ExDocker

export PATH="/Users/jhonathas/.asdf/installs/elixir/1.9.1/.mix/escripts:$PATH"

# Stow

export STOW_DIR=$HOME/.dotfiles

export HISTFILE=~/Dropbox/dotfiles/shell/.zsh_history
