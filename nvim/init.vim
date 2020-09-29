" vim: set foldmethod=marker:

" {{{ Variables
let g:os = substitute(system('uname'), "\n", "", "")
if g:os == "Linux"
    set clipboard=unnamedplus
endif
let lightweight = 0
let dev = 1
" }}}

" {{{ TODO:
" 	- look at writing a simple plugin which uses the tree command and folds to
"   	visualize your location in the directory tree
" 	- look at writing a simple plugin which provides a GUI for vim-plug
" 	- look at writing a simple plugin which provides a GUI for installing coc plugins
" 	- look at writing a simple plugin for interactively resolving merge conflicts
" 	- figure out vimspector
" }}}

" {{{ Basic Settings

set history=500                                                     " number of lines of history remembered
set lazyredraw                                                      " don't redraw during macro application
set showmatch                                                       " show matching brackets
set si                                                              " smart indent
set wrap                                                            " wrap lines
set number relativenumber                                           " line numbers (hybrid)
set mouse=a                                                         " enable mouse (sometimes just easier)
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   " ignored files in wildmenu
set foldenable                                                      " enable folding
set foldmethod=syntax 						    " fold based on language syntax
set foldlevelstart=10
set foldnestmax=10                                                  " 10 nested fold max
set scrolloff=5                                                     " always keep 5 lines visible above and below
set laststatus=2                                                    " always display statusline
set tabstop=4                                                       " tab width
set cursorline 							    " highlight current line
set conceallevel=1


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

" fold using syntax in markdown files
let g:markdown_folding = 1

" netrw with no banner
let g:netrw_banner = 0
let g:netrw_altv = 1

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" fix background color erase bug with vim
let &t_ut=''

" }}}

" {{{ Install Plugins

call plug#begin()

" {{{ appearance
" gruvbox
Plug 'morhetz/gruvbox'

" nice mode line
Plug 'itchyny/lightline.vim'
" }}}

" {{{ file browser
" icons
Plug 'ryanoasis/vim-devicons'

" fast file browser
" Plug 'justinmk/vim-dirvish'

" fast file tree viewer / file manager
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" unix file commands
Plug 'tpope/vim-eunuch'

" focused reading view
Plug 'junegunn/goyo.vim'

" }}}

" {{{ junegunn
" fuzzy finder
" :h fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" }}}

" {{{ tpope
" comment lines
" :h commentary
Plug 'tpope/vim-commentary'

" vim git client
" :h fugitive
Plug 'tpope/vim-fugitive'

" automatically detect indent
Plug 'tpope/vim-sleuth'
" }}}

" {{{ language support
" tex support
Plug 'lervag/vimtex'

" vim wiki
Plug 'vimwiki/vimwiki'

" Automatic bullet points
Plug 'dkarter/bullets.vim'

if dev
    " golang support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " language server client
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " FZF integration for coc.nvim
    Plug 'antoinemadec/coc-fzf'

    " Snippets
    Plug 'honza/vim-snippets'

    " Jenkinsfile
    Plug 'martinda/Jenkinsfile-vim-syntax'    
endif
" }}}

" {{{ misc
" disable syntax-based folding while editing to prevent slowdown
Plug 'Konfekt/FastFold'

" visualize the undo tree
Plug 'mbbill/undotree'

" interface to grep
Plug 'mhinz/vim-grepper'
" }}}

" {{{ New: need to investigate more
" automatic persistent Vim sessions
" Plug 'thaerkh/vim-workspace'
" }}}

call plug#end()

" }}}

" {{{ Functions

" splitting and moving between windows
" Taken from http://www.agillo.net/simple-vim-window-management/
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
	if (match(a:key,'[jk]'))
	    wincmd v
	else
	    wincmd s
	endif
	exec "wincmd ".a:key
    endif
endfunction

" Lets me run different compile commands depending on the filename
" (this is my way of avoiding learning how to use makeprg)
function SmartCompile()
    if @% =~ "test\.go$"
	:GoTestCompile
    elseif @% =~ "\.go$"
	:GoBuild
    else
	:make
    endif
endfunction

" Show full path to file. If in Git dir, show path relative to the Git root.
" Taken from: https://github.com/itchyny/lightline.vim/issues/293
function! LightlineFilename()
    let root = fnamemodify(fnamemodify(get(b:, 'git_dir'), ':h'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
	return path[len(root)+1:]
    endif
    return expand('%')
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

" }}}

" {{{ Configure Plugins

" gruvbox dark colorscheme
set background=dark
colorscheme gruvbox

" icons in fern
let g:fern#renderer = "nerdfont"
let g:fern#drawer_width = 50

" setup fzf file and buffer searching
if lightweight
    let g:fzf_preview_window = ''
endif

" floating fzf layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:vimtex_view_method = 'zathura'

" vimwiki location
let g:vimwiki_list = [{ 'path': '~/qnap/home/vimwiki', 'path_html': '~/qnap/Web' }]

let g:lightline = {
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
	    \ },
	    \ 'component_function': {
	    \   'gitbranch': 'FugitiveHead',
	    \   'filename': 'LightlineFilename',
	    \   'cocstatus': 'coc#status',
	    \ },
	    \ }
let g:lightline.colorscheme = 'gruvbox'

let g:tex_flavor = 'latex'

if dev
    " golang syntax highlighting
    let g:go_highlight_variable_assignments = 1    
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_generate_tags = 1

    " -------------------------------------------------------------------------------------------------
    " coc.nvim default settings
    " -------------------------------------------------------------------------------------------------

    " if hidden is not set, TextEdit might fail.
    set hidden
    " Better display for messages
    set cmdheight=2
    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes

    " Map <tab> for trigger completion, completion confirm, snippet expand and jump
    " like VSCode. >
    inoremap <silent><expr> <TAB>
		\ pumvisible() ? coc#_select_confirm() :
		\ coc#expandableOrJumpable() ?
		\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()

    function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

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

    " Show all code actions
    nmap <leader>a :<C-u>CocFzfList actions<cr>

    " Show file outline
    nmap <leader>o :<C-u>CocFzfList outline<cr>

    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    let g:go_def_mapping_enabled = 0

    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    let g:coc_global_extensions = [ 'coc-json', 'coc-snippets', 'coc-lua', 'coc-clangd', 'coc-solargraph', 'coc-java', 'coc-vimtex' ]
endif

" }}}

" {{{ Keybindings

" gx without netrw
nnoremap gx <Cmd>call OpenLink()<CR>

" fast save
nnoremap <leader>w :w<cr>

" use ESC to enter normal mode in terminal
tnoremap <ESC> <C-\><C-n>

" easy window switching and creation
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" find file
nnoremap <leader>e :Files<cr>
" switch buffers
nnoremap <leader>b :Buffers<cr>
" find help
nnoremap <leader>h :Helptags<cr>
" lines in buffer
nnoremap <leader>l :BLines<cr>
" find recursively
nnoremap <leader>f :Rg<cr>

" interactive git status
nnoremap <leader>g :G<cr>

nnoremap <leader>dh :diffget //2<CR>
nnoremap <leader>dl :diffget //3<CR>

" <space><space> to compile
nnoremap <leader><space> :call SmartCompile()<cr>

if dev
    nnoremap <leader>n :cnext<cr>
    nnoremap <leader>p :cprevious<cr>
    nnoremap <leader>si :GoDebugStep<cr>
    nnoremap <leader>so :GoDebugStepOut<cr>
endif

nnoremap <silent> <leader>t :Fern . -drawer -reveal=% -toggle<cr>

" }}}

" {{{ Not Currently Used
" Written myself
" function NERDTreeSmartToggleFind()
"     if !g:NERDTree.ExistsForTab()
" 		" If the current tab has no NERD tree, try to mirror another tab's
"         :NERDTreeMirror
"         if g:NERDTree.ExistsForTab()
"             if @% != ""
" 				" if a file is open in the current buffer, find it
"                 :NERDTreeFind
"             endif
"         elseif @% == ""
"             :NERDTree
"         else
"             :NERDTreeFind
"         endif
"     elseif g:NERDTree.IsOpen() || @% == ""
"         :NERDTreeToggle
"     else
" 		" Call NERDTreeFind if the current tab's NERD tree is hidden and there
" 		" is a file open in the current buffer.
"         :NERDTreeFind                        
"     endif
" endfunction
" }}}
"
" " The highlighted when the dirvish buffer was made
" let t:pre_dirvish_win_id = 0

" " Find the window ID which currently has an open dirvish buffer, if any
" function GetDirvishWinID()
"     if &filetype == 'dirvish'
" 	return win_getid()
"     endif

"     let l:curr_bufnr = bufnr()
"     let l:win_id = 0
"     for l:buf in tabpagebuflist()
" 	execute 'silent buf' l:buf
" 	if &filetype == 'dirvish'
" 	    let l:win_id = bufwinid(l:buf)
" 	endif
" 	execute 'silent buf' l:curr_bufnr

" 	if l:win_id
" 	    return l:win_id
" 	endif
"     endfor
" endfunction

" " If the current file is a dirvish file, close dirvish.
" " Otherwise, open dirvish to the far left.
" " 	- if dirvish is already open, replace it.
" function ToggleDirvish()
"     let l:dirvish_win_id = GetDirvishWinID()
"     let l:curr_filename = @%
"     if l:dirvish_win_id
" 	if l:dirvish_win_id == win_getid()
" 	    execute 'q'
" 	    if t:pre_dirvish_win_id
" 		call win_gotoid(t:pre_dirvish_win_id)
" 	    endif
" 	else
" 	    execute win_gotoid(l:dirvish_win_id)
" 	    execute 'Dirvish ' . l:curr_filename
" 	    execute "normal! /" . fnamemodify(l:curr_filename, ":t") . "\<cr>"
" 	endif
"     else
" 	let t:pre_dirvish_win_id = win_getid()
" 	if @% == ""
" 	    :Vexplore
" 	else
" 	    :Vexplore %
" 	endif
"     endif
" endfunction

" " Made this for 2 reasons:
" " 	1. so that I can remap l so that it behaves like <CR>
" " 	2. so that I can open files in my other window, like NERDTree
" function OpenFileDirvish()
"     let file_to_open = getline('.')
"     let s:sep = exists('+shellslash') && !&shellslash ? '\' : '/'
"     let isdir = (file_to_open[-1:] == s:sep)
"     if isdir
" 	call dirvish#open('edit', 0)
"     else
" 	if !t:pre_dirvish_win_id
" 	    execute 'edit ' . file_to_open
" 	else
" 	    execute win_gotoid(t:pre_dirvish_win_id)
" 	    execute 'edit ' . file_to_open
" 	endif
"     endif
" endfunction
"
" " override netrw commands with dirvish equivalents
" let g:loaded_netrwPlugin = 1
" command! -nargs=? -complete=dir Explore Dirvish <args>
" command! -nargs=? -complete=dir Sexplore topleft split | silent Dirvish <args>
" command! -nargs=? -complete=dir Vexplore topleft 80vsplit | silent Dirvish <args>
" toggle vertical file explorer
"
" nnoremap <silent> <leader>t :call ToggleDirvish()<cr>

" " dirvish mappings
" autocmd FileType dirvish
" 	    \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
" 	    \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
" 	    \ |nnoremap <silent><buffer> <CR> :call OpenFileDirvish()<CR><Left>
" 	    \ |nnoremap <silent><buffer> l :call OpenFileDirvish()<CR><Left>
" 	    \ |nmap <silent><buffer> h <Plug>(dirvish_up)

source ~/.config/nvim/imerge.vim
