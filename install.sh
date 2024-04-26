#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

# assumes zsh
ln -s $PWD/zsh/.zsh_aliases ~/.zsh_aliases
ln -s $PWD/zsh/.zsh_init ~/.zsh_init
ln -s $PWD/zsh/.zsh_theme ~/.zsh_theme
ln -s $PWD/zsh/.p10k.zsh ~/.p10k.zsh

ln -s $PWD/git/.gitmessage ~/.gitmessage
# ln -s $PWD/git/.gitconfig ~/.gitconfig

ln -s $PWD/vim/.vimrc ~/.vimrc
mkdir -p ~/.config
ln -s $PWD/nvim ~/.config/nvim

$PWD/git/git_aliases.sh

