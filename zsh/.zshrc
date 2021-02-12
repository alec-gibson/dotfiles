# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim

autoload -Uz compinit
compinit

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
setopt COMPLETE_ALIASES

aqua="#8ec07c"
orange="#fe8019"
blue="#83a598"

PS1="[%F{$aqua}%n%f@%F{$orange}%m %F{$blue}%~%f] "

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.aliases.zsh
source $HOME/.vars.zsh