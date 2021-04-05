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

" Simple - written myself
" toggle whether the tmux split is open or not
function ToggleVimux()
  if exists("g:VimuxRunnerIndex")
      call VimuxCloseRunner()
  else
      call VimuxOpenRunner()
  endif
endfunction

" Show full path to file. If in Git dir, show path relative to the Git root.
" Taken from: https://github.com/itchyny/lightline.vim/issues/293
function! LightlineFilename()
    let root = fnamemodify(fnamemodify(get(b:, 'git_dir'), ':h'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
	return path[len(root)+1:]
    endif
    return expand('%')
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
