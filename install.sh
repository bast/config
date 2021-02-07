#!/usr/bin/env bash
set -euf -o pipefail

# create symlinks
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/gitconfig ~/.gitconfig

# install omf following https://github.com/oh-my-fish/oh-my-fish#installation
install_file=$(mktemp)
curl -L https://get.oh-my.fish > $install_file
fish $install_file --path=~/.local/share/omf --config=$PWD/omf

# replace default theme with my preferred one
rm -rf ~/.local/share/omf/themes/default/
git clone --branch radovan/simple https://github.com/bast/theme-default.git ~/.local/share/omf/themes/default/
