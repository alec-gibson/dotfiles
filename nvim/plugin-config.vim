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
" colorscheme parchment
" colorscheme solarized8

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk = 'nvr'

" vim-dispatch config
let g:dispatch_no_maps = 1

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
	    \ },
	    \ 'tab': {
		\ 'active': [ 'tabnum', 'filename', 'modified' ],
		\ 'inactive': [ 'tabnum', 'filename', 'modified' ]
	    \ },
	    \ 'tab_component_function': {
	    \   'filename': 'LightlineTabFilename',
	    \ },
	    \ 'colorscheme': 'gruvbox_material',
	    \ }

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

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
let g:compe.documentation = v:true

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
