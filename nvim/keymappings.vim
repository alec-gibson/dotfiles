nnoremap <leader>w :w<cr>
nnoremap gx <Cmd>call OpenLink()<CR>

" project-wide recursive grep
" nnoremap <C-g> :Grep 
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

" fzf mappings
nnoremap <leader>e :call OpenFile()<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>H :Helptags<cr>
nnoremap <leader>f :RG<cr>
nnoremap <leader>d :LspDiagnostics 0<cr>

" fzf-project mappings
nnoremap <leader>p :FzfSwitchProject<cr>

" fugitive mappings
nnoremap <leader>g :G<cr>

" fern mappings
nnoremap <silent> <leader>t :Fern . -drawer -reveal=% -toggle<cr>

" vimux mappings
nnoremap <silent> <leader>v :call ToggleVimux()<cr>
nnoremap <silent> <leader>V :VimuxPromptCommand<cr>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" cancel using C-c, but stay in insert mode
inoremap <silent><expr> <C-c>     compe#close('<C-e>')

function s:init_fern()
    nnoremap <buffer> <C-h> :TmuxNavigateLeft<CR>
    nnoremap <buffer> <C-j> :TmuxNavigateDown<CR>
    nnoremap <buffer> <C-k> :TmuxNavigateUp<CR>
    nnoremap <buffer> <C-l> :TmuxNavigateRight<CR>
endfunction

augroup fern-config
    autocmd FileType fern call s:init_fern()
augroup END
