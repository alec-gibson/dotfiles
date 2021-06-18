# colored man pages (set less pager colouring)
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

export BAT_THEME="ansi"

export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/alacritty -e /usr/bin/nvim'
export BROWSER='/usr/bin/firefox --new-tab %s & disown'
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --no-ignore --follow --glob "!.git/*"'
export PATH="$HOME/.roswell/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/scripts:$PATH"

export SHELL="/bin/zsh"
