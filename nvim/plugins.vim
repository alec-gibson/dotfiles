call plug#begin('~/.config/vim-plug/plugins')

Plug 'lambdalisue/fern.vim' 						" fast file tree viewer / file manager
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'

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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'
Plug 'ojroques/nvim-lspfuzzy'

" switch to using init.lua

" check out lervag/wiki.vim

" check out coding in Fennel
"
" Olical Blog Posts:
" https://oli.me.uk/neovim-configuration-and-plugins-in-fennel-lisp/
" https://oli.me.uk/conversational-software-development/
"
" Olical YouTube Channel:
" https://www.youtube.com/user/OliverCaldwell
"
" Specifically His Vimconf Talk:
" https://www.youtube.com/watch?v=RU28xy9JXxs&list=PLcTu2VkAIIWzD2kicFNHN2c35XQCeZdsv&index=6
"
" Plugins:
Plug 'Olical/conjure'
Plug 'Olical/aniseed'
Plug 'bakpakin/fennel.vim'

" Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"
" Learn Lua:
" https://github.com/nanotee/nvim-lua-guide
"
" MAYBE Look Into Clojure Down The Road:
" https://liquidz.github.io/vim-iced/

call plug#end()
