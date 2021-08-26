" {{{ Variables
let g:os = substitute(system('uname'), "\n", "", "")
" }}}

" {{{ TODO:
"     - look at writing a simple plugin for interactively resolving merge conflicts
"     - figure out vimspector
" }}}

lua << EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end
EOF

set hidden " if hidden is not set, TextEdit might fail.
set cmdheight=2 " Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give ins-completion-menu messages.
" set signcolumn=number " show signs in the number column
set signcolumn=no
set completeopt=menu,menuone,noselect
set belloff+=ctrlg
set shell=bash

set history=500                                                     " number of lines of history remembered
set lazyredraw                                                      " don't redraw during macro application
set showmatch                                                       " show matching brackets
set si                                                              " smart indent
set wrap                                                            " wrap lines
set number                                                          " line numbers
set mouse=a                                                         " enable mouse (sometimes just easier)
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   " ignored files in wildmenu
set nofoldenable                                                    " disable folding
set scrolloff=5                                                     " always keep 5 lines visible above and below
set laststatus=2                                                    " always display statusline
set tabstop=4                                                       " tab width
set cursorline                                 " highlight current line
set nrformats=                                 " make C-x and C-a treat numbers with leading zeroes as decimal
set conceallevel=1
set grepprg=rg\ --vimgrep\ --hidden
set noshowmode                                 " don't need to show mode because of lightline

" search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
if has('nvim')
    set inccommand=nosplit
endif

" no error bells
set noerrorbells
set novisualbell
set tm=500

" use the patience diff algorithm
set diffopt=internal,filler,algorithm:histogram,indent-heuristic

" filetype plugins
filetype on
filetype plugin on
filetype indent on

" set leader key
let mapleader = " "
let maplocalleader = ","

" netrw with no banner
let g:netrw_banner = 0
let g:netrw_altv = 1

" fix background color erase bug with vim
let &t_ut=''

command! -nargs=+ Grep execute 'silent grep! <args>' | copen

exec "luafile " . stdpath("config") . "/lua/plugins.lua"

" theme options
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:codeschool_contrast_dark = 'medium'
colorscheme codeschool

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk = 'nvr'

" vim-dispatch config
let g:dispatch_no_maps = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_disable_keybindings = 1

let g:slimv_balloon = v:true
" let g:slimv_browser_cmd = "tmux split-window -h w3m"
let g:slimv_browser_cmd = "tmux new-window w3m"
let g:slimv_clhs_root = 'http://www.lispworks.com/documentation/HyperSpec/Body/'
let g:slimv_ctags = '/usr/bin/ctags -Ra --language-force=lisp .'
let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_repl_split_size = 10
let g:slimv_keybindings = 1
let g:slimv_echolines = 1
let g:slimv_impl = 'sbcl'
let g:slimv_repl_name = 'REPL'
let g:slimv_repl_split = 2 " horizontal split below

" set the default browser command to be used by vim-go
let g:go_play_browser_command = 'tmux new-window w3m %URL%'

" Lets me run different compile commands depending on the filename
" TODO: learn how to use makeprg
function SmartCompile()
    if @% =~ "test\.go$"
    :GoTestCompile
    elseif @% =~ "\.go$"
    :GoBuild
    elseif @% =~ "\.wiki$"
    :Vimwiki2HTML
    else
    :Make
    endif
endfunction

" Stole this off reddit.
" Use gx to open files and URLs, without depending on netrw.
function! OpenLink()
    let file = expand('<cfile>')
    if g:os == "Linux"
    call jobstart('xdg-open '..file, {'detach': v:true})
    else
    call jobstart('open '..file, {'detach': v:true})
    endif
endfunction

" evaluate lisp form, then insert result in a comment at the end of the line
function! EvalAndInsertSingleLine()
    redir! > /tmp/lispeval
    call SlimvEvalExp()
    redir END
    call system("sed -i '/^$/d' /tmp/lispeval")
    read /tmp/lispeval
    exe "normal kA ;\<ESC>JF)"
endfunction

exec "luafile " . stdpath("config") . "/lua/treesitter-config.lua"
exec "luafile " . stdpath("config") . "/lua/lsp-config.lua"
exec "luafile " . stdpath("config") . "/lua/telescope-config.lua"
exec "luafile " . stdpath("config") . "/lua/general.lua"

cnoreabbrev vwi VimwikiIndex
cnoreabbrev vwh VimwikiAll2HTML

nnoremap <leader>w :w<cr>
nnoremap gx <Cmd>call OpenLink()<CR>

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>

" use ESC to enter normal mode in terminal
" tnoremap <ESC> <C-\><C-n>

" compilation / testing
nnoremap <leader><space> :call SmartCompile()<cr>
nnoremap <C-Space> :Dispatch<cr>

" Telescope
nnoremap <leader>e <Cmd>Telescope find_files theme=get_ivy<cr>
nnoremap <leader>b <Cmd>Telescope buffers theme=get_ivy<cr>
nnoremap <leader>H <Cmd>Telescope help_tags theme=get_ivy<cr>
nnoremap <leader>f <Cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <leader>m <Cmd>Telescope man_pages theme=get_ivy<cr>

" fugitive
nnoremap <leader>g :G<cr>

" symbols-outline
nnoremap <leader>o :SymbolsOutline<cr>

" lsp
nnoremap <silent> gy <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gd <Cmd>Telescope lsp_definitions theme=get_ivy<CR>
nnoremap <silent> gm <Cmd>Telescope lsp_implementations theme=get_ivy<CR>
nnoremap <silent> gr <Cmd>Telescope lsp_references theme=get_ivy<CR>
nnoremap <leader>a <Cmd>Telescope lsp_code_actions theme=get_ivy<CR>
nnoremap <leader>d <Cmd>Telescope lsp_document_diagnostics theme=get_ivy<cr>
" nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <leader>r <Cmd>Lspsaga rename<CR>

" easy window creation
nnoremap <silent> <leader>h :wincmd v<CR>
nnoremap <silent> <leader>j :wincmd s \| wincmd j<CR>
nnoremap <silent> <leader>k :wincmd s<CR>
nnoremap <silent> <leader>l :wincmd v \| wincmd l<CR>

" tree view
nnoremap <silent> <leader>t :NvimTreeToggle<cr>

" neuron default bindings
" click enter on [[my_link]] or [[[my_link]]] to enter it
nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>

" create a new note
nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>

" find your notes, click enter to create the note if there are not notes that match
nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
" insert the id of the note that is found
nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

" find the backlinks of the current note all the note that link this note
nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
" same as above but insert the found id
nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

" find all tags and insert
nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>

" start the neuron server and render markdown, auto reload on save
nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>

" go to next [[my_link]] or [[[my_link]]]
nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" go to previous
nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Dispatch commands
autocmd FileType go let b:dispatch = 'go test ' . getcwd() . '/pkg/...'

" View GoDoc info in w3m (like Lisp hyperspec)
autocmd FileType go set keywordprg=:Lspsaga\ hover_doc

" Lisp hyperspec
autocmd FileType lisp nnoremap <buffer> K <Cmd>call SlimvHyperspec()<CR>

" Binding for evaluating lisp forms
autocmd FileType lisp nnoremap <buffer> <localleader>p <Cmd>call EvalAndInsertSingleLine()<CR>

" Close the repl if it's the last window open
autocmd BufEnter REPL if winnr("$") == 1 | q | endif
