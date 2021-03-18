call plug#begin('~/.config/vim-plug/plugins')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'tpope/vim-eunuch' 						" unix file commands
Plug 'tpope/vim-commentary' 						" comment lines
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' 						" automatically detect indent
Plug 'tpope/vim-dispatch'

Plug 'christoomey/vim-tmux-navigator' 					" seamless interop with tmux splits

Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-gruvbox8'

Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim' 						" focused reading view
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'							" NOTE: next time you use latex, setup the texlab language server
Plug 'vimwiki/vimwiki'
Plug 'dkarter/bullets.vim'
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'hashivim/vim-hashicorp-tools'

Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-anyblock'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'anott03/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'
Plug 'ojroques/nvim-lspfuzzy'

" TODO: check out lervag/wiki.vim

" Plugins:
Plug 'Olical/conjure'
Plug 'Olical/aniseed'
Plug 'bakpakin/fennel.vim'
Plug 'tami5/compe-conjure'

Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"
call plug#end()
