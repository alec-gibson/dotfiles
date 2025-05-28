# Lines configured by zsh-newuser-install
setopt autocd extendedglob
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# case insensitive path-completion
zstyle ':completion:*' menu select matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
setopt COMPLETE_ALIASES

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /usr/bin/terraform terraform

# Immediately append to history
setopt INC_APPEND_HISTORY

# Include timestamps in history
setopt EXTENDED_HISTORY

# Don't show duplicates when searching history with CTRL+R
setopt HIST_FIND_NO_DUPS

aqua="#8ec07c"
orange="#fe8019"
blue="#83a598"
PS1="[%F{$aqua}%n%f@%F{$orange}%m %F{$blue}%~%f] "

# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh
source $HOME/.aliases.zsh
source $HOME/.vars.zsh

# TODO:
# source $HOME/.secrets.zsh
# source $HOME/git/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# TODO:
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [[ -s "/Users/agibson/.gvm/scripts/gvm" ]] && source "/Users/agibson/.gvm/scripts/gvm"

# removes an entry from my ssh known hosts
# sx() {
#   ex -c "g/$1/d | wq" ~/.ssh/known_hosts
# }
