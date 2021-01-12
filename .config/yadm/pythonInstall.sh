#!/bin/bash

if ( which -s py ); then
  if [[ "$(dirname "$(which py)")" == "$HOME/bin" ]]; then
    export PYTHON="py"
  fi
else
  export PYTHON="python3"
fi

echo "Using Python \"$PYTHON\"."

if !( which -s "$PYTHON" ); then
  echo "I don't know where Python is."
  exit -1
fi


##############
#  Packages  #
##############

# basics
PS="scipy numpy"
PS="$PS colorama progress pygments" # for terminals
PS="$PS matplotlib pandas"
PS="$PS pandocfilters"
# executables
PS="$PS ipython"
PS="$PS manimce"
PS="$PS jupyterlab nbstripout"
## jupyter
PS="$PS jupyterlab-git jupyterlab-latex"
PS="$PS voila voila-gridstack"
PS="$PS ipywidgets bqplot pythreejs beakerx cookiecutter"
# scraping
PS="$PS beautifulsoup4 requests"

#############
#  Install  #
#############

"$PYTHON" -m pip install --upgrade pip setuptools

"$PYTHON" -m pip install --upgrade $PS

# build jupyter
#py -m jupyter lab clean # This part may be a bit much
#py -m jupyter lab build
