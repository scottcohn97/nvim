" Disable inserting comment leader after hitting o or O
set formatoptions-=o

" Disable inserting comment leader after hitting <Enter> in insert mode
set formatoptions-=r

" Set the folding related options for vim script. Setting folding option
" in modeline is annoying in that the modeline get executed each time the
" window focus is lost (see http://tinyurl.com/yyqyyhnc)
set foldmethod=expr foldlevel=0 foldlevelstart=-1
	\ foldexpr=utils#VimFolds(v:lnum) foldtext=utils#MyFoldText()

" Use :help command for keyword when pressing `K` in vim file,
" see `:h K` and https://bre.is/wC3Ih-26u
set keywordprg=:help

" Only define following variable if Auto-pairs plugin is used
if &runtimepath =~? 'auto-pairs'
	let b:AutoPairs = AutoPairsDefine({'<' : '>'})

	" Do not use `"` for vim script since `"` is also used for comment
	let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", "`":"`", '<':'>'}
endif
