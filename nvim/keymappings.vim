nnoremap <leader>w :w<cr>
nnoremap gx <Cmd>call OpenLink()<CR>

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>

" use ESC to enter normal mode in terminal
" tnoremap <ESC> <C-\><C-n>

" compilation / testing
nnoremap <leader><space> :call SmartCompile()<cr>
nnoremap <C-Space> :Dispatch<cr>

" fzf
nnoremap <leader>e :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>H :Helptags<cr>
nnoremap <leader>f :RG<cr>
nnoremap <leader>d :LspDiagnostics 0<cr>

" fzf-project
nnoremap <leader>p :FzfSwitchProject<cr>

" fugitive
nnoremap <leader>g :G<cr>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab>      compe#confirm('<CR>')
inoremap <silent><expr> <C-c>     compe#close('<C-e>')

" lsp
nnoremap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gm <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gy <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>r <Cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>a <Cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>o <Cmd>lua vim.lsp.buf.document_symbol()<CR>

" easy window creation
nnoremap <silent> <leader>h :wincmd v<CR>
nnoremap <silent> <leader>j :wincmd s \| wincmd j<CR>
nnoremap <silent> <leader>k :wincmd s<CR>
nnoremap <silent> <leader>l :wincmd v \| wincmd l<CR>

" vim-tmux-navigator
function s:init_fern()
    nnoremap <buffer> <C-h> :TmuxNavigateLeft<CR>
    nnoremap <buffer> <C-j> :TmuxNavigateDown<CR>
    nnoremap <buffer> <C-k> :TmuxNavigateUp<CR>
    nnoremap <buffer> <C-l> :TmuxNavigateRight<CR>
endfunction

" fern
augroup fern-config
    autocmd FileType fern call s:init_fern()
augroup END

" fern
nnoremap <silent> <leader>t :Fern . -drawer -reveal=% -toggle<cr>
