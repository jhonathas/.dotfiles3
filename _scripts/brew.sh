#!/usr/bin/env bash

echo ""
echo "=============================="
echo "Install brew tool"
echo "=============================="
echo ""

if test ! $(which brew)
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew tap caskroom/cask
    brew install mas stow
fi

brew bundle --file="${HOME}/Brewfile"

echo "OK"
