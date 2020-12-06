set history=500                                                     " number of lines of history remembered
set lazyredraw                                                      " don't redraw during macro application
set showmatch                                                       " show matching brackets
set si                                                              " smart indent
set wrap                                                            " wrap lines
set number relativenumber                                           " line numbers (hybrid)
set mouse=a                                                         " enable mouse (sometimes just easier)
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   " ignored files in wildmenu
set nofoldenable                                                    " disable folding
set scrolloff=5                                                     " always keep 5 lines visible above and below
set laststatus=2                                                    " always display statusline
set tabstop=4                                                       " tab width
set cursorline 							    " highlight current line
set nrformats= 							    " make C-x and C-a treat numbers with leading zeroes as decimal
set conceallevel=1
set grepprg=rg\ --vimgrep
set noshowmode 							    " don't need to show mode because of lightline

" search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
if has('nvim')
    set inccommand=nosplit
endif

" no error bells
set noerrorbells
set novisualbell
set tm=500

" use the patience diff algorithm
set diffopt=internal,filler,algorithm:histogram,indent-heuristic

" filetype plugins
filetype on
filetype plugin on
filetype indent on

" set leader key
let mapleader = " "
let maplocalleader = ","

" netrw with no banner
let g:netrw_banner = 0
let g:netrw_altv = 1

" theme options
if has('termguicolors')
    set termguicolors
endif
set background=dark

" fix background color erase bug with vim
let &t_ut=''

command! -nargs=+ Grep execute 'silent grep! <args>' | copen
