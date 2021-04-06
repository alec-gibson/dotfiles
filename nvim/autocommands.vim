" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Dispatch commands
autocmd FileType go let b:dispatch = 'go test ' . getcwd() . '/pkg/...'

" View GoDoc info in w3m (like Lisp hyperspec)
autocmd FileType go nnoremap <buffer> <localleader>h <Cmd>GoDocBrowser<CR>

" Binding for evaluating lisp forms
autocmd FileType lisp nnoremap <buffer> <localleader>p <Cmd>call EvalAndInsertSingleLine()<CR>

" Close the repl if it's the last window open
autocmd BufEnter REPL if winnr("$") == 1 | q | endif
