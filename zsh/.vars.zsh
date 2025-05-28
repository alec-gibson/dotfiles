export BROWSER=/usr/bin/firefox
export EDITOR=/opt/homebrew/bin/nvim
export GIT_EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/alacritty -e /opt/homebrew/bin/nvim'

# colored man pages (set less pager colouring)
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000

export CLICOLOR="true"

export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --no-ignore --follow --glob "!.git/*"'

# TODO
# export GOPATH=
# export GOPRIVATE=
# TODO
# export PATH=

# TODO
export cdpath=(. ~)
