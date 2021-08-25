return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      "NvimTreeToggle"
    },
    setup = function()
      require "plugins.tree"
    end
  }
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
  use { 'oberblastmeister/neuron.nvim', requires = {{'nvim-telescope/telescope.nvim'}} }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = {{'nvim-telescope/telescope.nvim'}} }

  use 'christoomey/vim-tmux-navigator'
  use {"adisen99/codeschool.nvim", requires = {"rktjmp/lush.nvim"}}
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use 'mbbill/undotree'
  use 'lervag/vimtex'
  use 'dkarter/bullets.vim'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'hashivim/vim-hashicorp-tools'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSInstall maintained | TSUpdate'}
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {{'nvim-treesitter/nvim-treesitter'}} }

  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-pandoc'
  use 'norcalli/snippets.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'simrat39/symbols-outline.nvim'

  use 'milisims/nvim-luaref'
  use 'nanotee/luv-vimdocs'

  use 'Olical/conjure'
  use 'Olical/aniseed'
  use 'bakpakin/fennel.vim'
  use 'tami5/compe-conjure'
  use 'kovisoft/slimv'

  use {'alec-gibson/nvim-tetris', branch = 'dev'}
end)
