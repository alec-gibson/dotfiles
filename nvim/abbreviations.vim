" go test all
cnoreabbrev gta exec "call VimuxRunCommand('cd ".getcwd()." && clear && go test ./pkg/...')"

" go test package
cnoreabbrev gtp call VimuxRunCommandInDir('clear && go test', 0)

" go test function
cnoreabbrev gtf GolangTestFocused
