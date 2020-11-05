" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" neovim completion in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
