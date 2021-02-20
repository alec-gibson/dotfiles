call plug#begin('~/.config/vim-plug/plugins')

Plug 'lambdalisue/fern.vim' 						" fast file tree viewer / file manager
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'

Plug 'tpope/vim-eunuch' 						" unix file commands
Plug 'tpope/vim-commentary' 						" comment lines
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' 						" automatically detect indent

Plug 'christoomey/vim-tmux-navigator' 					" seamless interop with tmux splits
Plug 'benmills/vimux' 							" run commands in tmux splits
Plug 'benmills/vimux-golang' 						" run golang tests intmux splits

Plug 'sainnhe/gruvbox-material'
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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'
Plug 'ojroques/nvim-lspfuzzy'

call plug#end()
