if exists('g:loaded_ctrlp_samename') && g:loaded_ctrlp_samename
	finish
endif
let g:loaded_ctrlp_samename = 1

let s:samename_var = {
			\  'init':   'ctrlp#samename#init(s:crbufnr, s:dyncwd)',
			\  'exit':   'ctrlp#samename#exit()',
			\  'accept': 'ctrlp#samename#accept',
			\  'lname':  'samename',
			\  'sname':  'samename',
			\  'type':   'samename',
			\  'sort':   1,
			\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
	let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:samename_var)
else
	let g:ctrlp_ext_vars = [s:samename_var]
endif

function! ctrlp#samename#init(bufnr, cwd)
	" Cache the ctrlp working directory to ensure that we open the file from the
	" root directory (so the relative paths are relative from the correct
	" location).
	let s:cwd = a:cwd

	" Use the current filename (no extension) to filter the filelist.
	let fname = fnamemodify(bufname(a:bufnr), ':t:r')
	return filter(ctrlp#files(), 'v:val =~ "'. fname .'"')
endfunc

function! ctrlp#samename#accept(mode, str)
	call ctrlp#exit()
	exec 'lcd '. s:cwd
	call ctrlp#acceptfile(a:mode, a:str)
endfunction

function! ctrlp#samename#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#samename#id()
	return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
