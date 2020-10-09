" {{{ Variables
let g:os = substitute(system('uname'), "\n", "", "")
let g:lightweight = 0
let g:dev = 1
" }}}

" {{{ TODO:
" 	- look at writing a simple plugin which uses the tree command and folds to visualize your location in the directory tree
" 	- look at writing a simple plugin which provides a GUI for vim-plug
" 	- look at writing a simple plugin which provides a GUI for installing coc plugins
" 	- look at writing a simple plugin for interactively resolving merge conflicts
" 	- figure out vimspector
" }}}

exec "source " . stdpath("config") . "/settings.vim"
exec "source " . stdpath("config") . "/plugins.vim"
exec "luafile " . stdpath("config") . "/lsp-config.lua"
exec "source " . stdpath("config") . "/plugin-config.vim"
exec "source " . stdpath("config") . "/functions.vim"
exec "source " . stdpath("config") . "/autocommands.vim"
exec "source " . stdpath("config") . "/keymappings.vim"
exec "source " . stdpath("config") . "/abbreviations.vim"
