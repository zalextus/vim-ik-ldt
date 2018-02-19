if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let s:cpo_save = &cpo
set cpo-=C

setlocal ignorecase
setlocal indentexpr=GetLdtIndent()
setlocal indentkeys+=*<Return>
setlocal nosmartindent

if exists("*GetLdtIndent")
 finish
endif

function! GetLdtIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)

  let line = getline(lnum)

  if line =~ '^\s*\(BEGIN\|DEFINE\)\>'
      let ind = ind + &sw
  endif

  let cline = getline(v:lnum)

  if cline =~ '^\s*\(END\)\>'
    let ind = ind - &sw
  endif

  return ind

endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:ts=8:sts=2:sw=2