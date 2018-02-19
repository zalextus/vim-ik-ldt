if exists("b:did_ftplugin")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

let b:did_ftplugin     = 1
let b:current_ftplugin = 'ldt'

if !exists("b:match_words")
    let b:match_ignorecase = 1

    let b:match_words = '\%(\<begin\>\|\<define\>\):\<end\>'
endif

let b:undo_ftplugin = "unlet! b:match_words"

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:sw=4:
