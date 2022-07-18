#!/bin/sh

set -e

DIRECTORY="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload"
DESTINATION="${DIRECTORY}/plug.vim"
URL='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl --silent --fail --location --output "${DESTINATION}" --create-dirs "${URL}"

# neovim
nvim -es -i NONE -c "PlugInstall" -c "qa" || \
    nvim -e -i NONE -c "PlugInstall" -c "qa"
