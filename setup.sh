#!/usr/bin/env bash

# ==========================
# Global Setup variables
# ==========================

export PRIVATE_DOTFILE_HTTPS_REPO="https://github.com/jhonathas/.dotfiles_private.git"
export PRIVATE_DOTFILE_SSH_REPO="git@github.com:jhonathas/.dotfiles_private.git"
export PRIVATE_DOTFILE_PATH=~/.dotfiles_private

export DOTFILES_PATH=~/.dotfiles

# ==========================
# Private dotfiles
# ==========================

if ! [ -d "$PRIVATE_DOTFILE_PATH" ]; then
  git clone $PRIVATE_DOTFILE_HTTPS_REPO $PRIVATE_DOTFILE_PATH
  cd $PRIVATE_DOTFILE_PATH
  git remote set-url origin "$PRIVATE_DOTFILE_SSH_REPO"

  echo ""
  echo "!! Stoped !!"
  echo "Your private dotfiles is not configured."
  echo ""

  exit
fi

# ==========================
# Menu
# ==========================

echo ""
echo "Choose the device to setup:"
echo ""
echo "1) PC (macOS)"
echo "2) PC (Ubuntu) (i3wm)"
echo "3) Macbook Pro (macOS)"
echo "4) Macbook Pro (Ubuntu) (i3wm)"
echo ""
read -p "Device number: " device_opt

export DEVICE=""; export OS=""; export WM=""

case $device_opt in
  "1") DEVICE="PC"        ; OS="macos"   ; WM="macos"  ; ./_setup-macos.sh    ;;
  "2") DEVICE="PC"        ; OS="ubuntu"; WM="i3wm" ; ./_setup-ubuntu.sh ;;
  "3") DEVICE="macbook-pro" ; OS="macos"   ; WM="macos"  ; ./_setup-macos.sh    ;;
  "4") DEVICE="macbook-pro" ; OS="ubuntu"; WM="i3wm" ; ./_setup-ubuntu.sh ;;
  *) echo "!! Invalid option !!" ;;
esac

# ==========================
# Finish
# ==========================

cd $DOTFILES_PATH

echo ""
echo "Finished!"
echo "You need to restart your system to apply the configuration."
echo ""
