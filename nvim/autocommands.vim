" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Dispatch commands
autocmd FileType go let b:dispatch = 'go test ' . getcwd() . '/pkg/...'
