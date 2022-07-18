#!/bin/zsh

here="$(dirname "$0")"
. "$here/../scriptlib.sh"

TLMGR="$(which tlmgr)"
if [[ ( "0" != "$?" ) || -z "$TLMGR" ]]; then
  printok 1 "tlmgr not found!"
  exit -1
fi

cmdprint sudo "$TLMGR" update -self -all
