call plug#begin('~/.config/vim-plug/plugins')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'tpope/vim-eunuch' 						" unix file commands
Plug 'tpope/vim-commentary' 						" comment lines
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' 						" automatically detect indent
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

Plug 'christoomey/vim-tmux-navigator' 					" seamless interop with tmux splits
Plug 'sainnhe/gruvbox-material'
Plug 'ajgrf/parchment'

Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'							" NOTE: next time you use latex, look into the texlab language server
Plug 'dkarter/bullets.vim'
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-hashicorp-tools'

Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

Plug 'norcalli/snippets.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'
Plug 'ojroques/nvim-lspfuzzy'

" TODO: check out lervag/wiki.vim

" Fennel
Plug 'Olical/conjure'
Plug 'Olical/aniseed'
Plug 'bakpakin/fennel.vim'
Plug 'tami5/compe-conjure'

" Common Lisp
Plug 'kovisoft/slimv'

Plug 'edkolev/tmuxline.vim'

call plug#end()
