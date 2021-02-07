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
nnoremap <leader>e :Telescope find_files<cr>
nnoremap <leader>b :Telescope buffers<cr>
nnoremap <leader>H :Telescope help_tags<cr>
nnoremap <leader>f :Telescope live_grep<cr>
nnoremap <leader>k :Telescope keymaps<cr>
nnoremap <leader>m :lua require'telescope.builtin'.man_pages(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>c :lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>L :Telescope loclist<cr>
nnoremap <leader>q :Telescope quickfix<cr>

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
