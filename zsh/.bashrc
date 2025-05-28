export BUILTIN_MANPAGE='/usr/share/man/man1/builtin.1'
customMan() {
                MANPAGE="$(/usr/bin/man -w $@)"
                EXIT_CODE="$?"
                if ! [ "$EXIT_CODE" -eq 0 ]; then
                        echo "Use help instead?"
                        select yn in "Yes" "No"; do
                                case $yn in
                                        Yes ) help $@; break;;
                                        No ) break;;
                                esac
                        done
                elif [ "$MANPAGE" = "$BUILTIN_MANPAGE" ]; then
                        echo "$@ is a bash builtin."
                        echo "Use help instead?"
                        select yn in "Yes" "No"; do
                                case $yn in
                                        Yes ) help $@; break;;
                                        No ) /usr/bin/man $@; break;;
                                esac
                        done
                else
                        /usr/bin/man $@
                fi
}
alias man=customMan
