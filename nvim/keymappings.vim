" completion mappings
imap <C-j> <Plug>(completion_next_source)
imap <C-k> <Plug>(completion_prev_source)
imap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" gx without netrw
nnoremap gx <Cmd>call OpenLink()<CR>

" fast save
nnoremap <leader>w :w<cr>

" use ESC to enter normal mode in terminal
tnoremap <ESC> <C-\><C-n>

" find file
nnoremap <leader>e :Files<cr>
" switch buffers
nnoremap <leader>b :Buffers<cr>
" find help
nnoremap <leader>H :Helptags<cr>
" find recursively
nnoremap <leader>f :Rg<cr>

" interactive git status
nnoremap <leader>g :G<cr>

" diagnostics
nnoremap <leader>d :OpenDiagnostic<cr>

" <space><space> to compile
nnoremap <leader><space> :call SmartCompile()<cr>

if g:dev
    nnoremap <leader>n :cnext<cr>
    nnoremap <leader>p :cprevious<cr>
    nnoremap <leader>si :GoDebugStep<cr>
    nnoremap <leader>so :GoDebugStepOut<cr>
endif

" toggle file browser drawer
nnoremap <silent> <leader>t :Fern . -drawer -reveal=% -toggle<cr>

" project-wide recursive grep
nnoremap <C-g> :GrepperRg 

" easy window creation
nnoremap <silent> <leader>h :wincmd v<CR>
nnoremap <silent> <leader>j :wincmd s \| wincmd j<CR>
nnoremap <silent> <leader>k :wincmd s<CR>
nnoremap <silent> <leader>l :wincmd v \| wincmd l<CR>

" vimux mappings
nnoremap <silent> <leader>v :call ToggleVimux()<cr>
nnoremap <silent> <leader>V :VimuxPromptCommand<cr>
