" {{{ Variables
let g:os = substitute(system('uname'), "\n", "", "")
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
set nofoldenable                                                    " disable folding
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

" {{{ misc
" visualize the undo tree
Plug 'mbbill/undotree'

" interface to grep
Plug 'mhinz/vim-grepper'
" }}}

" {{{ language support
" tex support
" NOTE: next time you use latex, setup the texlab language server
Plug 'lervag/vimtex'

" vim wiki
Plug 'vimwiki/vimwiki'

" Automatic bullet points
Plug 'dkarter/bullets.vim'

if dev
    " golang support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Jenkinsfile
    Plug 'martinda/Jenkinsfile-vim-syntax'    

    " LSP config
    Plug 'neovim/nvim-lspconfig'

    " autocomplete
    Plug 'nvim-lua/completion-nvim'

    " better default diagnostic behaviour
    Plug 'nvim-lua/diagnostic-nvim'
    
    " snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
endif
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
" LSP settings
:lua << EOF
    local nvim_lsp = require('nvim_lsp')
    local buf_set_keymap = vim.api.nvim_buf_set_keymap

    local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	require'diagnostic'.on_attach()

	-- Mappings.
	local opts = { noremap=true, silent=true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    end

    local servers = {'gopls', 'solargraph', 'jdtls'}
    for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
	    on_attach = on_attach,
	}
    end
EOF

" completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt+=menuone,noinsert,noselect
set shortmess+=c
set belloff+=ctrlg
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-n>'}
\]

" diagnostic-nvim settings
let g:diagnostic_show_sign = 0

" vim-vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'

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
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	    \ },
	    \ 'component_function': {
	    \   'gitbranch': 'FugitiveHead',
	    \   'filename': 'LightlineFilename',
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
endif

" }}}

" {{{ Keybindings
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

" list diagnostics
nnoremap <leader>d :GoDiagnostics<cr>

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
