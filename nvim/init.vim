" {{{ Variables
let g:os = substitute(system('uname'), "\n", "", "")
" }}}

" {{{ TODO:
" 	- look at writing a simple plugin which uses the tree command and folds to visualize your location in the directory tree
" 	- look at writing a simple plugin which provides a GUI for vim-plug
" 	- look at writing a simple plugin which provides a GUI for installing coc plugins
" 	- look at writing a simple plugin for interactively resolving merge conflicts
" 	- figure out vimspector
" }}}

lua << EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
EOF

exec "source " . stdpath("config") . "/settings.vim"
" exec "source " . stdpath("config") . "/plugins.vim"
exec "luafile " . stdpath("config") . "/plugins.lua"
exec "source " . stdpath("config") . "/plugin-config.vim"
exec "source " . stdpath("config") . "/functions.vim"
exec "source " . stdpath("config") . "/commands.vim"
exec "luafile " . stdpath("config") . "/treesitter-config.lua"
exec "luafile " . stdpath("config") . "/lsp-config.lua"
exec "luafile " . stdpath("config") . "/telescope-config.lua"
exec "source " . stdpath("config") . "/abbreviations.vim"
exec "source " . stdpath("config") . "/keymappings.vim"
exec "source " . stdpath("config") . "/autocommands.vim"
exec "luafile " . stdpath("config") . "/snippets.lua"
exec "luafile " . stdpath("config") . "/general.lua"
" exec "source " . stdpath("config") . "/local-config.vim"

