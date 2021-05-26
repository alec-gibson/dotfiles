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

" Show full path to file. If in Git dir, show path relative to the Git root.
" Taken from: https://github.com/itchyny/lightline.vim/issues/293
" Added custom logic for including icons
function! LightlineFilename()
    let fname = expand('%')
    let root = fnamemodify(fnamemodify(get(b:, 'git_dir'), ':h'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
	let fname = path[len(root)+1:]
    endif
    let fname = fname !=# '' ? fname : '[No Name]'
    let ext = fnamemodify(fname, ':e')
    let icon = luaeval("require'nvim-web-devicons'.get_icon(\"" . fname . "\", \"" . ext . "\", { default = true })")
    return icon . ' ' . fname
endfunction

function! LightlineTabFilename(n)
    let fname = lightline#tab#filename(a:n)
    let ext = fnamemodify(fname, ':e')
    let icon = luaeval("require'nvim-web-devicons'.get_icon(\"" . fname . "\", \"" . ext . "\", { default = true })")
    return icon . ' ' . fname
endfunction

" Stole this off reddit.
" Use gx to open files and URLs, without depending on netrw.
function! OpenLink()
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
