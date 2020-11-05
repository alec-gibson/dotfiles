nnoremap <leader>w :w<cr>
nnoremap gx <Cmd>call OpenLink()<CR>

" project-wide recursive grep
nnoremap <C-g> :Grep 
nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>

" easy window creation
nnoremap <silent> <leader>h :wincmd v<CR>
nnoremap <silent> <leader>j :wincmd s \| wincmd j<CR>
nnoremap <silent> <leader>k :wincmd s<CR>
nnoremap <silent> <leader>l :wincmd v \| wincmd l<CR>

" use ESC to enter normal mode in terminal
" tnoremap <ESC> <C-\><C-n>

" <space><space> to compile
nnoremap <leader><space> :call SmartCompile()<cr>

" completion mappings
" imap <C-j> <Plug>(completion_next_source)
" imap <C-k> <Plug>(completion_prev_source)
" imap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
" smap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
" imap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
" smap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" 		Coc mappings
" ========================================
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent><nowait> <leader>a  :<C-u>CocFzfList actions<cr>
nnoremap <silent><nowait> <leader>d  :<C-u>CocFzfList dagnostics<cr>
nnoremap <silent><nowait> <leader>o  :<C-u>CocFzfList outline<cr>
" ========================================

" fzf mappings
nnoremap <leader>e :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>H :Helptags<cr>
nnoremap <leader>f :Rg<cr>

" fugitive mappings
nnoremap <leader>g :G<cr>

" fern mappings
nnoremap <silent> <leader>t :Fern . -drawer -reveal=% -toggle<cr>

" vimux mappings
nnoremap <silent> <leader>v :call ToggleVimux()<cr>
nnoremap <silent> <leader>V :VimuxPromptCommand<cr>
