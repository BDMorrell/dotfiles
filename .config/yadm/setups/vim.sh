#!/bin/zsh

here="$(dirname "$0")"
. "$here/../scriptlib.sh"

MINVIMVERSION=8
VERSION="$(vim --version | head -n 1 | grep -o "\d*\.\d*")"
VERSIONMAJOR="$(echo "$VERSION" | grep -o "\d*")"

dimprint "vim is version $VERSION"

[[ "${VERSIONMAJOR}" -ge "$MINVIMVERSION" ]];
versionok="$?"

printok $versionok "vim's version >= $MINVIMVERSION"

if [[ "$versionok" -eq "0" ]]; then
  VUNDLETARGET="$HOME/.vim/bundle/Vundle.vim"
  if [[ ! -d "$VUNDLETARGET" ]]; then
    echo "Installing Vundle..."
    cmdprint mkdir -p "$VUNDLETARGET"
    cmdprint git clone -- "https://github.com/VundleVim/Vundle.vim.git" "$VUNDLETARGET"
    printok $? "git finished with $?"
  else
    printok 0 "Vundle is already installed."
  fi
fi
