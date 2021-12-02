return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- cache require() calls
  use 'lewis6991/impatient.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'

  use 'nvim-lua/plenary.nvim'
  use { 'nvim-lua/popup.nvim', requires = {{'nvim-lua/plenary.nvim'}} }
  use { 'lewis6991/gitsigns.nvim', requires = {{'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}} }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = {{'nvim-telescope/telescope.nvim'}} }

  use 'christoomey/vim-tmux-navigator'
  use {
    "adisen99/codeschool.nvim",
    requires = {"rktjmp/lush.nvim"},
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'alvarosevilla95/luatab.nvim',
    requires='kyazdani42/nvim-web-devicons'
  }
  use 'mbbill/undotree'
  use 'lervag/vimtex'
  use 'dkarter/bullets.vim'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'hashivim/vim-hashicorp-tools'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSInstall maintained | TSUpdate'}
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {{'nvim-treesitter/nvim-treesitter'}} }
  use { 'nvim-treesitter/playground', requires = {{'nvim-treesitter/nvim-treesitter'}} }

  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-pandoc'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'PaterJason/cmp-conjure'
  use {
    'andersevenrud/compe-tmux',
    branch = 'cmp'
  }

  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  use 'simrat39/symbols-outline.nvim'

  use 'milisims/nvim-luaref'
  use 'nanotee/luv-vimdocs'

  use 'Olical/conjure'
  use 'Olical/aniseed'
  use 'bakpakin/fennel.vim'
  use 'kovisoft/slimv'

  use {'alec-gibson/nvim-tetris', branch = 'dev'}
end)
