#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

mkdir -p $HOME/.local/bin

rm -rf $HOME/.local/bin/t
ln -s $DOTFILES/scripts/t $HOME/.local/bin/t
