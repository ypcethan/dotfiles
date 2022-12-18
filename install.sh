#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim
