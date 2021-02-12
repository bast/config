#!/usr/bin/env bash
set -euf -o pipefail

# create symlinks
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/gitconfig ~/.gitconfig

mkdir -p ~/.config/i3
ln -sf $PWD/config/i3/config ~/.config/i3/config

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/tpope/vim-commentary.git           ~/.vim/bundle/vim-commentary
git clone https://github.com/tpope/vim-markdown.git             ~/.vim/bundle/vim-markdown
git clone https://github.com/tpope/vim-sensible.git             ~/.vim/bundle/vim-sensible
