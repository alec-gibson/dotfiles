local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

vim.loader.enable()

opt.cmdheight = 2 -- Better display for messages
opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
opt.shortmess = "c" -- don't give ins-completion-menu messages.
opt.signcolumn = "no"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shell = "bash"
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
opt.showmode = false -- don't need to show mode because of lightline

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = "nosplit"

opt.grepprg = "rg --vimgrep --hidden --smart-case"
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- no error bells
-- opt.errorbells = false
-- opt.visualbell = false
opt.tm = 500

-- use the patience diff algorithm
opt.diffopt = { "internal", "filler", "algorithm:histogram", "indent-heuristic" }

-- set leader key
g.mapleader = " "
g.maplocalleader = ","

-- netrw with no banner
g.netrw_banner = 0
g.netrw_altv = 1

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("packages")

-- filetype plugins
cmd 'filetype on'
cmd 'filetype plugin on'
cmd 'filetype indent on'

-- fix background color erase bug with vim
-- g.&t_ut = ''

cmd [[
    command! -nargs=+ Grep execute 'silent grep! <args>' | copen
]]

cmd [[
    " Lets me run different compile commands depending on the filename
    " TODO: learn how to use makeprg
    function SmartCompile()
        if @% =~ "test\.go$"
        :GoTestCompile
        elseif @% =~ "\.go$"
        :GoBuild
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
]]

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>w', ':w<cr>')
map('n', 'gx', '<Cmd>call OpenLink()<CR>')

-- map('n', '<C-n>', ':cnext<cr>')
-- map('n', '<C-p>', ':cprevious<cr>')

-- use ESC to enter normal mode in terminal
-- map('t', '<ESC>', '<C-\><C-n>')

-- compilation / testing
map('n', '<leader><space>', ':call SmartCompile()<cr>', {silent = true, noremap = true})
-- map('n', '<C-Space>', ':Dispatch<cr>', {silent = true, noremap = true})

-- fugitive
map('n', '<leader>g', ':G<cr>', {silent = true, noremap = true})

-- symbols-outline
map('n', '<leader>o', ':SymbolsOutline<cr>', {silent = true, noremap = true})

-- mkdnflow
map('n', '<leader>x', ':MkdnToggleToDo<cr>', {silent = true, noremap = true})

-- lsp
map('n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', {silent = true, noremap = true})
map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>', {silent = true, noremap = true})

-- easy window creation
map('n','<leader>h', ':wincmd v<CR>', {silent = true, noremap = true})
map('n','<leader>j', ':wincmd s | wincmd j<CR>', {silent = true, noremap = true})
map('n','<leader>k', ':wincmd s<CR>', {silent = true, noremap = true})
map('n','<leader>l', ':wincmd v | wincmd l<CR>', {silent = true, noremap = true})

-- tree view
map('n','<leader>t', ':Neotree toggle reveal<cr>', {silent = true, noremap = true})

cmd [[
    " Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Remove trailing newlines before saving
    autocmd BufWritePre * :%s/\n\+\%$//e

    " Remove trailing whitespace before saving
    autocmd BufWritePre * :%s/\s\+$//e
]]
