function Imerge_setup_quickfix_and_labels()
    if !exists("b:merge_conflict_syntax")
	echo "Must run Imerge_setup() first"
	return
    endif
    " Save cursor position before doing anything that could screw it up
    normal ms

    let l:ours_label_lines = []
    g/^<<<<<<</call add(l:ours_label_lines, line('.'))

    let l:theirs_label_lines = []
    g/^=======/call add(l:theirs_label_lines, line('.'))

    let g:quickfix_lines = []
    g/^<<<<<<</call add(g:quickfix_lines, @% . ":" . line('.') . ": " . getline('.'))

    " load the quickfix_lines list into the quickfix list
    cexpr g:quickfix_lines

    " Add virtual text to all the 'Ours' lines
    for label_line in l:ours_label_lines
	call nvim_buf_set_virtual_text(0, g:merge_conflict_labels_namespace, label_line - 1, [["OURS", "ConflictLabel"]], {})
    endfor

    " Add virtual text to all the 'Theirs' lines
    for label_line in l:theirs_label_lines
	call nvim_buf_set_virtual_text(0, g:merge_conflict_labels_namespace, label_line - 1, [["THEIRS", "ConflictLabel"]], {})
    endfor

    " Return cursor to its original position, and remove search highlights
    normal `s
    nohlsearch
endfunction

function s:Imerge_do_resolve(user_input, start_line, middle_line, end_line)
    if !exists("b:merge_conflict_syntax")
	echo "Must run Imerge_setup() first"
	return
    endif
    let l:offset = 0
    if a:user_input == 1 " (ours)
	call deletebufline(bufname(), a:middle_line, a:end_line)
	call deletebufline(bufname(), a:start_line)
	let l:offset = a:end_line - a:middle_line + 2
    elseif a:user_input == 2 " (theirs)
	call deletebufline(bufname(), a:end_line)
	call deletebufline(bufname(), a:start_line, a:middle_line)
	let l:offset = a:middle_line - a:start_line + 2
    elseif a:user_input == 3 " (both)
	call deletebufline(bufname(), a:end_line)
	call deletebufline(bufname(), a:middle_line)
	call deletebufline(bufname(), a:start_line)
	let l:offset = 3
    elseif a:user_input == 4 " (neither)
	call deletebufline(bufname(), a:start_line, a:end_line)
	let l:offset = a:end_line - a:start_line + 1
    endif
    call nvim_buf_clear_namespace(0, g:merge_conflict_labels_namespace, a:start_line - 1, a:end_line - l:offset + 1)
endfunction

function Imerge_resolve(strategy)
    if !exists("b:merge_conflict_syntax")
	echo "Must run Imerge_setup() first"
	return
    endif
    " starting from the current cursor location, find each of the merge
    " conflict delimiters for the surrounding (or the next) merge conflict
    execute "normal! k/>>>>>>>\<cr>"
    let l:end_line = line('.')
    execute "normal! ?=======\<cr>"
    let l:middle_line = line('.')
    execute "normal! ?<<<<<<<\<cr>"
    let l:start_line = line('.')

    " apply the resolution strategy
    call s:Imerge_do_resolve(a:strategy, l:start_line, l:middle_line, l:end_line)
    redraw!
endfunction

function Imerge_interactive_resolve()
    if !exists("b:merge_conflict_syntax")
	echo "Must run Imerge_setup() first"
	return
    endif
    " starting from the current cursor location, find each of the merge
    " conflict delimiters for the surrounding (or the next) merge conflict
    normal k
    execute "normal! />>>>>>>\<cr>"
    let l:end_line = line('.')
    execute "normal! ?=======\<cr>"
    let l:middle_line = line('.')
    execute "normal! ?<<<<<<<\<cr>"
    let l:start_line = line('.')

    call cursor(l:start_line, 1)
    redraw!

    let l:user_input = confirm("Select resolution strategy:", "&ours\n&theirs\n&both\n&neither\n&skip")

    " apply the resolution strategy
    if user_input != 5
	call s:Imerge_do_resolve(l:user_input, l:start_line, l:middle_line, l:end_line)
    endif
    redraw!
endfunction

function Imerge()
    if !exists("b:merge_conflict_syntax")
	echo "Must run Imerge_setup() first"
	return
    endif
    let strategy = confirm("Select Imerge strategy:", "&interactive\n&ours\n&theirs\n&both\n&neither")
    if strategy == 1
	cdo call Imerge_interactive_resolve()
    else
	cdo call Imerge_resolve(strategy - 1)
    endif
endfunction

function Imerge_setup()
    let b:merge_conflict_syntax = 1

    " Create syntax groups for the Ours and Theirs sections of the merge conflict
    " Causes conflict delimiters to be highlighted seperately, and makes them concealable
    syntax region ConflictOurs matchgroup=ConflictDelimiters start="<<<<<<<.*" end="\ze=======" concealends
    syntax region ConflictTheirs matchgroup=ConflictDelimiters start="=======" end=">>>>>>>.*" concealends

    " Reasonable merge conflict highlighting
    highlight ConflictOurs ctermfg=green
    highlight ConflictTheirs ctermfg=red
    highlight ConflictDelimiters ctermfg=blue cterm=italic

    " Highlight the virtual text
    highlight ConflictLabel ctermfg=Yellow cterm=italic,bold

    " Create virtual text labels for merge conflict chunks
    let g:merge_conflict_labels_namespace = nvim_create_namespace("merge_conflict_labels")

    call Imerge_setup_quickfix_and_labels()
endfunction

command! ImergeSetup call Imerge_setup()
command! ImergeReload call Imerge_setup_quickfix_and_labels()
command! Imerge call Imerge()
command! ImergeResolveInteractive call Imerge_interactive_resolve()
command! ImergeResolveOurs call Imerge_resolve(1)
command! ImergeResolveTheirs call Imerge_resolve(2)
command! ImergeResolveBoth call Imerge_resolve(3)
command! ImergeResolveNeither call Imerge_resolve(4)

nnoremap <silent> <leader>is :ImergeSetup<CR>
nnoremap <silent> <leader>ir :ImergeReload<CR>
nnoremap <silent> <leader>im :Imerge<CR>
nnoremap <silent> <leader>ii :ImergeResolveInteractive<CR>
