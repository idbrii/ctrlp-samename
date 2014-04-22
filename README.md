ctrlp-samename
=============

Search ctrlp for files with the same name. Useful for switching between header
and implementation files.

To use, define a command like this:

    command! CtrlPSameName call ctrlp#init(ctrlp#samename#id())

Or a map like this:

    nnoremap <A-o> :call ctrlp#init(ctrlp#samename#id())<CR>

