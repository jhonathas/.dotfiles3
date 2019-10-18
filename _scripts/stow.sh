#!/usr/bin/env bash

echo ""
echo "=============================="
echo "Stow"
echo "=============================="
echo ""

stow_to_remove_list=(
  ~/.config/alacritty
  ~/.config/i3
  ~/.zshrc
  ~/.zsh_history
)

for s in ${stow_to_remove_list[@]}
do
  echo ""
  echo "---- removing $s ----"
  echo ""
  rm -rf ${s}
done

stow_list=(
  brew
  emacs
  git
  nvim
  shell
  tmux
  vim
  zsh
  alacritty-${DEVICE}-${OS}-${WM}
)

if [[ "$OS" == "ubuntu" ]]; then
  stow_ubuntu_list=(
    i3
    polybar
    redshift
    compton
  )

  stow_list=( `echo ${stow_list[@]}` `echo ${stow_ubuntu_list[@]}` )
fi

for s in ${stow_list[@]}
do
  echo ""
  echo "---- stowing $s ----"
  echo ""
  stow -v -t ${HOME} -d ${DOTFILES_PATH} $s
done

if [[ "$OS" == "ubuntu" ]]; then
  stow_usr_list=(
    etc-xorg-${DEVICE}-${OS}-${WM}
  )

  for s in ${stow_usr_list[@]}
  do
    echo ""
    echo "---- stowing /etc $s ----"
    echo ""

    sudo stow -v -t /etc -d ${STOW_DIR} $s
  done
fi

stow_private_list=(
  aws
  git
  shell
  ssh
  tmuxinator
)

for s in ${stow_private_list[@]}
do
  echo ""
  echo "---- stowing private $s ----"
  echo ""

  stow -v -t ${HOME} -d ${PRIVATE_DOTFILE_PATH} $s
done
