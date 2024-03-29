set mouse=r
set nowrap hlsearch
set showcmd cursorline
set number relativenumber
set tabstop=4 shiftwidth=4 smartindent noexpandtab autoindent
set foldmethod=syntax omnifunc=syntaxcomplete#Complete

syntax on
set runtimepath+=$HOME/.vim/odin.vim

hi Folded ctermbg=4 ctermfg=7
hi CursorColumn ctermbg=darkgrey cterm=bold

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

function HeaderSetup()
	let l:filename = expand("%:t")
	Stdheader
	call append(11, "#endif")
	call append(11, "#define _H")
	call append(11, "#ifndef _H")
	call append(11, "")
endfunction

augroup odin
	autocmd!
	autocmd BufRead *.odin set filetype=odin
	autocmd BufNewFile *.odin set filetype=odin
augroup END

nnoremap <F5> :call HeaderSetup()<CR>
nnoremap <F2> :call NorminetteCurrent()<CR>
nnoremap <F3> :call FormatCurrent()<CR>
nnoremap <F4> :call Norminette()<CR>
nnoremap gcc <S-I>// <Esc>
