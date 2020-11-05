" go testing abbreviations
cnoreabbrev gta exec "call VimuxRunCommand('cd ".getcwd()." && clear && go test ./pkg/...')"
cnoreabbrev gtp call VimuxRunCommandInDir('clear && go test', 0)
cnoreabbrev gtf GolangTestFocused

" vim wiki abbreviations
cnoreabbrev vwi VimwikiIndex
cnoreabbrev vwh VimwikiAll2HTML
