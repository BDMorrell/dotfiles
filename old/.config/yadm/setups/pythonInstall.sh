#!/bin/zsh

here="$(dirname "$0")"
. "$here/../scriptlib.sh"

if ( which -s py ); then
  if [[ "$(dirname "$(which py)")" == "$HOME/bin" ]]; then
    export PYTHON="py"
  fi
else
  export PYTHON="python3"
fi

echo "Using Python \"$PYTHON\"."

if ! which -s "$PYTHON"; then
  echo "I don't know where Python is."
  exit -1
fi

#############
#  Install  #
#############

cmdprint "$PYTHON" -m pip install --upgrade pip setuptools wheel

cmdprint "$PYTHON" -m pip install --upgrade -r "$here/../requirements.txt"

# build jupyter
#py -m jupyter lab clean # This part may be a bit much
#py -m jupyter lab build
