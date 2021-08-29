#!/bin/zsh

here="$(dirname "$0")"
. "$here/scriptlib.sh"

# Links
HomebrewREPO="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

# Checks
isMacOS() {
  [[ "$(uname)" = "Darwin" ]];
  return $?
}

checkCLT() { # check command line tools
  if isMacOS; then
    [[ -d "$(xcode-select -p)" ]];
    return $?
  else
    return 1;
  fi
}

checkHomebrew() {
  if checkCLT; then
    checkcmd brew
    return $?
  else
    return 1;
  fi
}

[[ -e "$HOME/README.md" ]] && cmdprint rm "$HOME/README.md"

if isMacOS; then
  echo "Setting up for MacOS"

  # Comman Line Tools
  if ! checkCLT; then
    echo "Installing command line tools..."
    cmdprint sudo xcode-select --install
    printok $? "xcode-select finished with $?"
  fi

  checkCLT
  printok $? "Command line tools"

  # Homebrew
  if ! checkHomebrew; then
    if confirm "Install Homebrew?"; then
      echo "Installing Homebrew..."
      cmdprint "$SHELL" -c "$(curl -fsSL $HomebrewREPO)"
      printok $? "Hombrew finished with $?"
    else
      echo "Skipping Homebrew."
    fi
  fi

  checkHomebrew
  printok $? "Homebrew"

  # Hombrew bundle (the Brewfile thing)
  if checkHomebrew && [[ -f "$HOME/.Brewfile" ]]; then
    if confirm "Run homebrew bundle to install everything in your Brewfile?";
    then
      cmdprint brew bundle --global
      printok $? "Hombrew bundle finished with $?"
      cmdprint rm "$HOME/.Brewfile.lock.json" 2>/dev/null;
    else
      echo "Skipping homebrew bundle"
    fi
  fi

fi

for file in "$here/setups/"*; do
  echo
  if confirm "Run the setup \"$(basename "$file")\"?"; then
    cmdprint "$SHELL" "$file"
    failed=$?
    scriptName="$(basename "$file")"
    dimprint "\"$scriptName\" finished with return status $failed"
    printok $failed "$scriptName"
  fi
done

echo
printok 0 "Bootstrap script finished!"
