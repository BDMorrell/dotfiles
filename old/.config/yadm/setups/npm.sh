#!/bin/zsh

here="$(dirname "$0")"
. "$here/../scriptlib.sh"

NPM="npm"
YARN="yarn"

cmdprint "$NPM" -g install "$NPM" "$YARN"
ok=$?
printok $ok Install npm
if (( $ok == 0 )); then
  cmdprint "$YARN" global add create-react-app
  printok $ok Install yarn

  # Update
  cmdprint "$NPM" -g upgrade
  cmdprint "$YARN" global upgrade
  printok 0 "Update npm and yarn"
else
  cmdprint "$NPM" -g upgrade
  printok 1 "Skiped yarn..."
fi
