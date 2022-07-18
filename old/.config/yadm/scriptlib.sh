# Util
if [[ -z "$SHELL" ]]; then
  SHELL="/bin/zsh"
fi

checkcmd() {
  which -s "$@" >/dev/null
  return $?
}

confirm() {
  read -qr "okay?${*:-"Continue?"} [y/n] "
  echo
  [[ $okay == 'y' ]];
  return $?
}

# Pretty print functions
term_green="$(tput setaf 10 || echo -n "")"
term_red="$(tput setaf 9 || echo -n "")"
term_dim="$(tput setaf 8 || echo -n "")"
term_normal="$(tput sgr0 || echo -n "")"

dimprint() {
  echo "$term_dim$*$term_normal"
}

cmdprint() {
  dimprint "$@";
  "$@";
}

printok() {
  pre=""
  if (( $1 == 0 )); then
    pre="$term_green\u2714$term_normal "
  else
    pre="$term_red\u2718$term_normal "
  fi
  shift
  echo "$pre$*"
}
