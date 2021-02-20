" colours
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" icons in fern
let g:fern#renderer = "nerdfont"
let g:fern#drawer_width = 50

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
let g:fzfSwitchProjectWorkspaces = [ '~/git' ]
let g:fzfSwitchProjectProjectDepth = -1
let g:fzfSwitchProjectGitInitBehavior = 'none'
let g:fzfSwitchProjectAlwaysChooseFile = 0

let g:UltiSnipsExpandTrigger = '<C-h>'
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

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
			\ 'path': v:true,
			\ 'buffer': v:true,
			\ 'calc': v:true,
			\ 'vsnip': v:false,
			\ 'ultisnips': v:true,
			\ 'nvim_lsp': v:true,
			\ 'nvim_lua': v:true,
			\ 'spell': v:true,
			\ 'tags': v:true,
			\ 'snippets_nvim': v:false,
			\ 'treesitter': v:true
			\ }

lua require('lspfuzzy').setup {}
