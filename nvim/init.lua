local execute = vim.api.nvim_command
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

opt.hidden = true -- if hidden is not set, TextEdit might fail.
opt.cmdheight = 2 -- Better display for messages
opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
opt.shortmess = "c" -- don't give ins-completion-menu messages.
opt.signcolumn = "no"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shell = "bash"
opt.history = 500                                                     -- number of lines of history remembered
opt.lazyredraw = true                                                      -- don't redraw during macro application
opt.showmatch = true                                                       -- show matching brackets
opt.si = true                                                              -- smart indent
opt.wrap = true                                                            -- wrap lines
opt.number = true                                                          -- line numbers
opt.mouse = "a"                                                         -- enable mouse (sometimes just easier)
opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }   -- ignored files in wildmenu
opt.foldenable = false -- disable folding
opt.scrolloff = 5                                                     -- always keep 5 lines visible above and below
opt.laststatus = 2                                                    -- always display statusline
opt.tabstop = 4                                                       -- tab width
opt.cursorline = true                                 -- highlight current line
opt.nrformats = ""                                 -- make C-x and C-a treat numbers with leading zeroes as decimal
opt.conceallevel = 1
opt.grepprg = "rg --vimgrep --hidden"
opt.showmode = false -- don't need to show mode because of lightline
opt.tabline = '%!v:lua.require\'luatab\'.tabline()'

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = "nosplit"

-- no error bells
opt.errorbells = false
opt.visualbell = false
opt.tm = 500

-- use the patience diff algorithm
opt.diffopt = { "internal", "filler", "algorithm:histogram", "indent-heuristic" }

-- filetype plugins
cmd 'filetype on'
cmd 'filetype plugin on'
cmd 'filetype indent on'

-- set leader key
g.mapleader = " "
g.maplocalleader = ","

-- netrw with no banner
g.netrw_banner = 0
g.netrw_altv = 1

-- fix background color erase bug with vim
-- g.&t_ut = ''

cmd [[
    command! -nargs=+ Grep execute 'silent grep! <args>' | copen
]]

require('packages')

opt.termguicolors = true
opt.background = "dark"
g.codeschool_contrast_dark = 'medium'
cmd 'colorscheme codeschool'

-- vimtex config
g.vimtex_view_method = 'zathura'
g.tex_flavor = 'latex'
g.vimtex_latexmk = 'nvr'

-- vim-dispatch config
g.dispatch_no_maps = 1

-- disable vim-go :GoDef short cut (gd)
-- this is handled by LanguageClient [LC]
g.go_def_mapping_enabled = 0
g.go_doc_keywordprg_enabled = 0

g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
-- g.nvim_tree_disable_keybindings = 1

g.slimv_balloon = true
-- g.slimv_browser_cmd = "tmux split-window -h w3m"
g.slimv_browser_cmd = "tmux new-window w3m"
g.slimv_clhs_root = 'http://www.lispworks.com/documentation/HyperSpec/Body/'
g.slimv_ctags = '/usr/bin/ctags -Ra --language-force=lisp .'
g.slimv_lisp = '/usr/bin/sbcl'
g.slimv_repl_split_size = 10
g.slimv_keybindings = 1
g.slimv_echolines = 1
g.slimv_impl = 'sbcl'
g.slimv_repl_name = 'REPL'
g.slimv_repl_split = 2 -- horizontal split below

-- set the default browser command to be used by vim-go
g.go_play_browser_command = 'tmux new-window w3m %URL%'

cmd [[
    " Lets me run different compile commands depending on the filename
    " TODO: learn how to use makeprg
    function SmartCompile()
        if @% =~ "test\.go$"
        :GoTestCompile
        elseif @% =~ "\.go$"
        :GoBuild
        elseif @% =~ "\.wiki$"
        :Vimwiki2HTML
        else
        :Make
        endif
    endfunction

    " Stole this off reddit.
    " Use gx to open files and URLs, without depending on netrw.
    function! OpenLink()
    let g:os = substitute(system('uname'), "\n", "", "")
        let file = expand('<cfile>')
        if g:os == "Linux"
        call jobstart('xdg-open '..file, {'detach': v:true})
        else
        call jobstart('open '..file, {'detach': v:true})
        endif
    endfunction

    " evaluate lisp form, then insert result in a comment at the end of the line
    function! EvalAndInsertSingleLine()
        redir! > /tmp/lispeval
        call SlimvEvalExp()
        redir END
        call system("sed -i '/^$/d' /tmp/lispeval")
        read /tmp/lispeval
        exe "normal kA ;\<ESC>JF)"
    endfunction
]]

require('treesitter-config')
require('lsp-config')
require('telescope-config')
require('general')

-- cnoreabbrev vwi VimwikiIndex
-- cnoreabbrev vwh VimwikiAll2HTML

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>w', ':w<cr>')
map('n', 'gx', '<Cmd>call OpenLink()<CR>')

map('n', '<C-n>', ':cnext<cr>')
map('n', '<C-p>', ':cprevious<cr>')

-- use ESC to enter normal mode in terminal
-- map('t', '<ESC>', '<C-\><C-n>')

-- compilation / testing
map('n', '<leader><space>', ':call SmartCompile()<cr>', {silent = true, noremap = true})
map('n', '<C-Space>', ':Dispatch<cr>', {silent = true, noremap = true})

-- Telescope
map('n', '<leader>e', '<Cmd>lua require("telescope.builtin").find_files({find_command={"rg", "--files", "--hidden", "--smart-case", "--no-ignore", "--follow", "--glob", "!.git/*"}})<cr>', {silent = true, noremap = true})
map('n', '<leader>b', '<Cmd>Telescope buffers<cr>', {silent = true, noremap = true})
map('n', '<leader>H', '<Cmd>Telescope help_tags<cr>', {silent = true, noremap = true})
map('n', '<leader>f', '<Cmd>Telescope live_grep<cr>', {silent = true, noremap = true})
map('n', '<leader>m', '<Cmd>Telescope man_pages<cr>', {silent = true, noremap = true})

-- fugitive
map('n', '<leader>g', ':G<cr>', {silent = true, noremap = true})

-- symbols-outline
map('n', '<leader>o', ':SymbolsOutline<cr>', {silent = true, noremap = true})

-- lsp
map('n', 'gy', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', {silent = true, noremap = true})
map('n','gd', '<Cmd>Telescope lsp_definitions<CR>', {silent = true, noremap = true})
map('n','gm', '<Cmd>Telescope lsp_implementations<CR>', {silent = true, noremap = true})
map('n','gr', '<Cmd>Telescope lsp_references<CR>', {silent = true, noremap = true})
map('n', '<leader>a', '<Cmd>Telescope lsp_code_actions theme=get_cursor<CR>', {silent = true, noremap = true})
map('n', '<leader>d', '<Cmd>Telescope lsp_document_diagnostics<CR>', {silent = true, noremap = true})
-- map('n','K', '<Cmd>Lspsaga hover_doc<CR>', {silent = true, noremap = true})
map('n','<leader>r', '<Cmd>Lspsaga rename<CR>', {silent = true, noremap = true})

-- easy window creation
map('n','<leader>h', ':wincmd v<CR>', {silent = true, noremap = true})
map('n','<leader>j', ':wincmd s | wincmd j<CR>', {silent = true, noremap = true})
map('n','<leader>k', ':wincmd s<CR>', {silent = true, noremap = true})
map('n','<leader>l', ':wincmd v | wincmd l<CR>', {silent = true, noremap = true})

-- tree view
map('n','<leader>t', ':NvimTreeToggle<cr>', {silent = true, noremap = true})

cmd [[
    " Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    
    " Dispatch commands
    autocmd FileType go let b:dispatch = 'go test ' . getcwd() . '/pkg/...'
    
    " View GoDoc info in w3m (like Lisp hyperspec)
    autocmd FileType go set keywordprg=:Lspsaga\ hover_doc
    
    " Lisp hyperspec
    autocmd FileType lisp nnoremap <buffer> K <Cmd>call SlimvHyperspec()<CR>
    
    " Binding for evaluating lisp forms
    autocmd FileType lisp nnoremap <buffer> <localleader>p <Cmd>call EvalAndInsertSingleLine()<CR>
    
    " Close the repl if it's the last window open
    autocmd BufEnter REPL if winnr("$") == 1 | q | endif
]]
