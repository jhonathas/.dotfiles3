#!/usr/bin/env bash

! xcode-select -p &> /dev/null && xcode-select --install

./_scripts/brew.sh
./_scripts/zsh.sh
./_scripts/stow.sh
./_scripts/vim.sh
./_scripts/asdf.sh
./_scripts/permission.sh

/usr/local/opt/fzf/install --all
