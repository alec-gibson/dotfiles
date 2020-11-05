" NOTE: these settings are for the nvim builtin LSP plugins

" " completion-nvim in every buffer
" set completeopt+=menuone,noinsert,noselect
" set shortmess+=c
" set belloff+=ctrlg
" let g:completion_enable_snippet = 'vim-vsnip'
" let g:completion_auto_change_source = 1
" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp', 'snippet']},
"     \{'mode': '<c-n>'}
" \]

" " diagnostic-nvim settings
" let g:diagnostic_show_sign = 0

" " vim-vsnip
" let g:vsnip_snippet_dir = '~/.config/nvim/snippets'

" colours
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE

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

" setup fzf file and buffer searching
if g:lightweight
    let g:fzf_preview_window = ''
endif
let g:fzf_layout = { 'down': '~40%' }

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

" vimwiki location
let g:vimwiki_list = [{ 'path': '~/qnap/home/vimwiki', 'path_html': '~/qnap/Web' }]

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
	    \ 'colorscheme': 'gruvbox',
	    \ }

" golang syntax highlighting
if g:dev
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

    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    let g:go_def_mapping_enabled = 0

    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    let g:coc_global_extensions = [ 'coc-json', 'coc-snippets', 'coc-lua', 'coc-clangd', 'coc-solargraph', 'coc-java', 'coc-vimtex', 'coc-vimlsp' ]

    let g:coc_fzf_preview = ''
    let g:coc_fzf_opts = []

endif
