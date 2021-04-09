#!/bin/sh

TMP="$(mktemp)"
curl -fsSL "$TMP" https://github.com/TheLocehiliosan/yadm/raw/master/yadm > "$TMP"
chmod +x "$TMP"
ln -s "$TMP" "$HOME/installFromNothing.sh"

"$HOME/installFromNothing.sh" clone --bootstrap https://github.com/BDMorrell/dotfiles.git

rm "$TMP" "$HOME/installFromNothing.sh"
