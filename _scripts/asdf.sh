#!/usr/bin/env bash

echo ""
echo "=============================="
echo "Install adsf tool"
echo "=============================="
echo ""

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

echo "OK"
