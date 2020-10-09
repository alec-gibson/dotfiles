call plug#begin()

" {{{ appearance
" gruvbox
Plug 'morhetz/gruvbox'

" nice mode line
Plug 'itchyny/lightline.vim'

" focused reading view
Plug 'junegunn/goyo.vim'
" }}}

" {{{ files
" icons
Plug 'ryanoasis/vim-devicons'

" fast file tree viewer / file manager
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" fuzzy finder
" :h fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" unix file commands
Plug 'tpope/vim-eunuch'
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

" {{{ tmux
" seamless interop with tmux splits
Plug 'christoomey/vim-tmux-navigator'

" run commands in tmux splits
Plug 'benmills/vimux'

" run golang tests intmux splits
Plug 'benmills/vimux-golang'
" }}}

" {{{ language support
" tex support
" NOTE: next time you use latex, setup the texlab language server
Plug 'lervag/vimtex'

" vim wiki
Plug 'vimwiki/vimwiki'

" Automatic bullet points
Plug 'dkarter/bullets.vim'

if g:dev
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
