# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/sbin:$PATH"

# pkg-config needs to find icu4c
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig"


################################################################################
# Stop if running interactively
case $- in
    *i*) ;;
      *) return;;
esac
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#####
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
################################################################################

# User configuration
export CLICOLOR=1
export LSCOLORS="GxFxBxDxCxEgEdxbxgxcxd"

[[ -f ~/.zshrc.sec ]] && source ~/.zshrc.sec

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias la="ls -A"
alias here="cd -P ."
alias ipy="ipython --profile=calculator"
alias cvim="vim -u ~/.vim/ycm-vimrc"
alias gcvim="gvim -u ~/.vim/ycm-vimrc"
alias cgvim="gvim -u ~/.vim/ycm-vimrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
