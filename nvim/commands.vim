" Add the --hidden option to the ripgrep command executed, so hidden files are
" included, but not files explicitly excluded by the gitignore file
command! -bang -nargs=? -complete=dir RG
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

command! -nargs=? Apropos call fzf#run(fzf#wrap({'source': 'man -k -s 1 '.shellescape(<q-args>).' | cut -d " " -f 1', 'sink': 'tab Man', 'options': ['--preview', 'MANPAGER=cat MANWIDTH='.(&columns/2-4).' man {}']}))
