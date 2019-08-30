#!/usr/bin/env bash
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

PRIVATE_STOW_DIR="${HOME}/Dropbox/dotfiles"

# Install Xcode Common
! xcode-select -p &> /dev/null && xcode-select --install

# Install brew
if test ! $(which brew)
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
fi

if [ ! -d ${PRIVATE_STOW_DIR} ]
then
    ! brew cask ls --versions dropbox &> /dev/null && brew cask install dropbox
    echo
    echo "Please, configure Dropbox to continue (enable download from dotfiles directory)!"
    echo
    echo "After configuration, rerun ./setup.sh"
    exit 1
fi

# Install mas to run brew bundle
if ! brew ls --versions mas &> /dev/null
then
    brew install mas stow
fi

# Oh My ZSH
if [ ! -d "${HOME}/.oh-my-zsh" ]
then
    curl -L http://install.ohmyz.sh | sh
fi

# Packages
packages=(
    alacritty
    brew
    emacs
    git
    nvim
    shell
    tmux
    vim
    zsh
)

private_packages=(
    aws
    git
    shell
    ssh
    tmuxinator
)

echo ""
echo "Stowing packages for user: ${whoami}"

# install packages and private packages available
for app in ${private_packages[@]}; do
    stow -v -t ${HOME} -d ${PRIVATE_STOW_DIR} $app
done

for app in ${packages[@]}; do
    stow -v -t ${HOME} -d ${STOW_DIR} $app
done

echo ""
echo "##### ALL DONE"


# Install brew packages
echo ""
echo "Brew is installing packages for user: ${whoami}"
echo

brew bundle --file="${HOME}/Brewfile"

echo ""
echo "##### ALL DONE"
echo

source "${HOME}/.zshrc"


asdf plugin-add ruby
asdf install ruby 2.6.4
asdf global ruby 2.6.4
source "${HOME}/.zshrc"
gem install tmuxinator

asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add postgres
asdf plugin-add redis
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring



# FZF
/usr/local/opt/fzf/install --all


pip3 install neovim
pip3 install --upgrade pip
pip3 install --upgrade neovim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim +UpdateRemotePlugins +qall
vim +checkhealth +qall

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
nvim +checkhealth +qall
