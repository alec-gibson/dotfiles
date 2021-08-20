nnoremap <leader>w :w<cr>
nnoremap gx <Cmd>call OpenLink()<CR>

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>

" use ESC to enter normal mode in terminal
" tnoremap <ESC> <C-\><C-n>

" compilation / testing
nnoremap <leader><space> :call SmartCompile()<cr>
nnoremap <C-Space> :Dispatch<cr>

" nnoremap <M-j> ddp
" nnoremap <M-k> ddkP
" vnoremap <M-j> :m '>+1<cr>gv
" vnoremap <M-k> :m '<-2<cr>gv

" fzf
" nnoremap <leader>e :Files<cr>
" nnoremap <leader>b :Buffers<cr>
" nnoremap <leader>H :Helptags<cr>
" nnoremap <leader>f :RG<cr>
" nnoremap <leader>d :LspDiagnostics 0<cr>
" nnoremap <leader>m :Apropos<cr>

" Telescope
nnoremap <leader>e <Cmd>Telescope find_files theme=get_ivy<cr>
nnoremap <leader>b <Cmd>Telescope buffers theme=get_ivy<cr>
nnoremap <leader>H <Cmd>Telescope help_tags theme=get_ivy<cr>
nnoremap <leader>f <Cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <leader>m <Cmd>Telescope man_pages theme=get_ivy<cr>

" fugitive
nnoremap <leader>g :G<cr>

" symbols-outline
nnoremap <leader>o :SymbolsOutline<cr>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab>     compe#confirm('<CR>')
inoremap <silent><expr> <C-c>     compe#close('<C-e>')

" snippets
" either expand the current snippet at the word or try to jump to the next position for the snippet.
inoremap <c-j> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
" jump backwards to the previous field. If you jump before the first field, it will cancel the snippet.
inoremap <c-k> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

" lsp
nnoremap <silent> gy <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gd <Cmd>Telescope lsp_definitions theme=get_ivy<CR>
nnoremap <silent> gm <Cmd>Telescope lsp_implementations theme=get_ivy<CR>
nnoremap <silent> gr <Cmd>Telescope lsp_references theme=get_ivy<CR>
nnoremap <leader>a <Cmd>Telescope lsp_code_actions theme=get_ivy<CR>
nnoremap <leader>d <Cmd>Telescope lsp_document_diagnostics theme=get_ivy<cr>
" nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <leader>r <Cmd>Lspsaga rename<CR>

" easy window creation
nnoremap <silent> <leader>h :wincmd v<CR>
nnoremap <silent> <leader>j :wincmd s \| wincmd j<CR>
nnoremap <silent> <leader>k :wincmd s<CR>
nnoremap <silent> <leader>l :wincmd v \| wincmd l<CR>

" tree view
nnoremap <silent> <leader>t :NvimTreeToggle<cr>

" neuron default bindings
" click enter on [[my_link]] or [[[my_link]]] to enter it
nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>

" create a new note
nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>

" find your notes, click enter to create the note if there are not notes that match
nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
" insert the id of the note that is found
nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

" find the backlinks of the current note all the note that link this note
nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
" same as above but insert the found id
nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

" find all tags and insert
nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>

" start the neuron server and render markdown, auto reload on save
nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>

" go to next [[my_link]] or [[[my_link]]]
nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" go to previous
nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]
