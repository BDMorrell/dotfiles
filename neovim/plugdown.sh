#!/bin/sh

set -e

DIRECTORY="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload"

rm -r "${DIRECTORY}"
