# Path to oh-my-zsh installation.
export ZSH="/home/moby/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Disable bi-weekly auto-update checks, redundant in a container.
DISABLE_AUTO_UPDATE="true"

# ohmyzsh plugins to load
plugins=(
    vi-mode
    git
    pip
)

source $ZSH/oh-my-zsh.sh

# Preferred editor.
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias l="ls -lh"
alias ll="ls -lAh"
