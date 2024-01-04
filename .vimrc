set nowrap hlsearch
set	number relativenumber
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4 tabstop=4 smartindent noexpandtab
set foldmethod=syntax

hi Folded ctermbg=4 ctermfg=7

function NorminetteAll()
	execute "!" "norminette"
endfunction

function FormatCurrent()
	print "WIP"
endfunction

function NorminetteCurrent()
	let &errorformat='%E%f: Error!,%C%>%s :: %l :: %v :: %m;'
	cexpr system('norminette ' . shellescape(expand('%')) . ' | sed -E "s/Error: ([A-Z_]+)\s+\(line:\s+([0-9]+),\s+col:\s+([0-9]+)\):\s+(.*)+$/\1 :: \2 :: \3 :: \4;/"')
	cwindow
endfunction

nnoremap <F2> :call NorminetteCurrent()<CR>
nnoremap <F3> :call FormatCurrent()<CR>
nnoremap <F4> :call Norminette()<CR>
nnoremap gcc <S-I>// <Esc>
