call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim' 						" focused reading view
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern.vim' 						" fast file tree viewer / file manager
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch' 						" unix file commands
Plug 'tpope/vim-commentary' 						" comment lines
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' 						" automatically detect indent
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator' 					" seamless interop with tmux splits
Plug 'benmills/vimux' 							" run commands in tmux splits
Plug 'benmills/vimux-golang' 						" run golang tests intmux splits
Plug 'lervag/vimtex'							" NOTE: next time you use latex, setup the texlab language server
Plug 'vimwiki/vimwiki'
Plug 'dkarter/bullets.vim'
Plug 'unblevable/quick-scope'
if g:dev
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'martinda/Jenkinsfile-vim-syntax'    
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'antoinemadec/coc-fzf'
    Plug 'honza/vim-snippets'
    Plug 'nvim-treesitter/nvim-treesitter'
endif

call plug#end()
