" completion-nvim in every buffer
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

" colours
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" icons in fern
let g:fern#renderer = "nerdfont"
let g:fern#drawer_width = 50

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
endif
