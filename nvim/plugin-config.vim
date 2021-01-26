" colours
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" icons in fern
let g:fern#renderer = "nerdfont"
let g:fern#drawer_width = 50

function s:init_fern()
    nnoremap <buffer> <C-h> :TmuxNavigateLeft<CR>
    nnoremap <buffer> <C-j> :TmuxNavigateDown<CR>
    nnoremap <buffer> <C-k> :TmuxNavigateUp<CR>
    nnoremap <buffer> <C-l> :TmuxNavigateRight<CR>
endfunction

augroup fern-config
    autocmd FileType fern call s:init_fern()
augroup END

let g:fzf_layout = { 'down': '~40%' }
let g:fzfSwitchProjectWorkspaces = [ '~/git' ]
let g:fzfSwitchProjectProjectDepth = -1
let g:fzfSwitchProjectGitInitBehavior = 'none'
let g:fzfSwitchProjectAlwaysChooseFile = 0

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk = 'nvr'

" vimwiki location
let g:vimwiki_list = [{ 'path': '~/geekserver/documents/vimwiki', 'path_html': '~/geekserver/documents/vimwiki' }]
let g:vimwiki_global_ext = 0 " don't enable vimwiki outside the configured directories

" simple aesthetic statusline
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
	    \ 'tabline': {
	    \ 	'left': [ [ 'tabs' ] ],
	    \ 	'right': [ [ 'close' ] ]
	    \ },
	    \ 'colorscheme': 'gruvbox_material',
	    \ }

" -------------------------------------------------------------------------------------------------
" coc.nvim settings
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

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:coc_global_extensions = [ 'coc-json', 'coc-snippets', 'coc-lua', 'coc-clangd', 'coc-solargraph', 'coc-java', 'coc-vimlsp', 'coc-vimtex' ]

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
