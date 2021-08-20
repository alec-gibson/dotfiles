call plug#begin('~/.config/vim-plug/plugins')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'tpope/vim-eunuch' 						" unix file commands
Plug 'tpope/vim-commentary' 						" comment lines
Plug 'tpope/vim-sleuth' 						" automatically detect indent
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Packages that require plenary
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'oberblastmeister/neuron.nvim'

Plug 'christoomey/vim-tmux-navigator' 					" seamless interop with tmux splits
Plug 'sainnhe/gruvbox-material'
Plug 'lifepillar/vim-solarized8'

Plug 'edkolev/tmuxline.vim'

Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'							" NOTE: next time you use latex, look into the texlab language server
Plug 'dkarter/bullets.vim'
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-hashicorp-tools'

Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSInstall maintained \| TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

Plug 'norcalli/snippets.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'
Plug 'ojroques/nvim-lspfuzzy'

" Documentation
Plug 'milisims/nvim-luaref'
Plug 'nanotee/luv-vimdocs'

" TODO: check out lervag/wiki.vim

" Fennel
Plug 'Olical/conjure'
Plug 'Olical/aniseed'
Plug 'bakpakin/fennel.vim'
Plug 'tami5/compe-conjure'

" Common Lisp
Plug 'kovisoft/slimv'

Plug 'alec-gibson/nvim-tetris' , {'branch': 'dev'}

call plug#end()
