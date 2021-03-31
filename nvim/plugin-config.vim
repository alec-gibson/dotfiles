" theme options
if has('termguicolors')
    set termguicolors
endif
set background=dark
" set background=light

" low contrast colorscheme
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" high contrast colorscheme
" let g:sonokai_transparent_background = 1
" colorscheme sonokai

" colorscheme solarized8
" colorscheme gruvbox8

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk = 'nvr'

" vim-dispatch config
let g:dispatch_no_maps = 1

" vimwiki location
let g:vimwiki_global_ext = 0 " don't enable vimwiki outside the configured directories

" simple aesthetic statusline
let g:lightline = {
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	    \ },
	    \ 'component_function': {
	    \   'gitbranch': 'FugitiveHead',
	    \   'filename': 'LightlineFilename',
	    \ },
	    \ 'tabline': {
	    \ 	'left': [ [ 'tabs' ] ],
	    \ 	'right': [ [ 'close' ] ]
	    \ },
	    \ 'colorscheme': 'gruvbox_material',
	    \ }

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:fzf_layout = { 'down': '~40%' }
let g:fzfSwitchProjectProjectDepth = -1
let g:fzfSwitchProjectGitInitBehavior = 'none'
let g:fzfSwitchProjectAlwaysChooseFile = 0

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100

let g:compe.source = {
			\ 'omni': v:false,
			\ 'conjure': v:true,
			\ 'path': v:true,
			\ 'buffer': v:true,
			\ 'calc': v:true,
			\ 'vsnip': v:false,
			\ 'ultisnips': v:false,
			\ 'nvim_lsp': v:true,
			\ 'nvim_lua': v:true,
			\ 'spell': v:true,
			\ 'tags': v:true,
			\ 'snippets_nvim': v:true,
			\ 'treesitter': v:false
			\ }

let g:conjure#extract#tree_sitter#enabled=v:true

let g:sexp_filetypes="clojure,scheme,lisp,timl,fennel,janet"

let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_disable_keybindings = 1

lua require('lspfuzzy').setup {}
