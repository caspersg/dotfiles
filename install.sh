#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################
mv ~/.zsh_aliases ~/.zsh_aliases.bak
mv ~/.zsh_init ~/.zsh_init.bak
mv ~/.zsh_theme ~/.zsh_theme.bak
mv ~/.p10k.zsh ~/.p10k.zsh.bak
mv ~/.gitmessage ~/.gitmessage.bak
# mv ~/.gitconfig ~/.gitconfig.bak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.editorconfig ~/.editorconfig.bak
mv ~/.gitignore ~/.gitignore.bak

# assumes zsh
ln -s "$(pwd)/zsh/.zsh_aliases" ~/.zsh_aliases
ln -s "$(pwd)/zsh/.zsh_init" ~/.zsh_init
ln -s "$(pwd)/zsh/.zsh_theme" ~/.zsh_theme
ln -s "$(pwd)/zsh/.p10k.zsh" ~/.p10k.zsh

ln -s "$(pwd)/git/.gitmessage" ~/.gitmessage
# ln -s "$(pwd)/git/.gitconfig" ~/.gitconfig

ln -s "$(pwd)/vim/.vimrc" ~/.vimrc
mkdir -p ~/.config
ln -s "$(pwd)/nvim" ~/.config/

ln -s "$(pwd)/.editorconfig" ~/.editorconfig
ln -s "$(pwd)/.gitignore" ~/.gitignore

$(pwd)/git/git_aliases.sh

