if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword ldtKeyword DEFINE BEGIN END
syn keyword ldtKeyword KEY CTX BASE TRANS

syn region ldtCommentL 
  \ start="#" 
  \ end="$"

syn region ldtStringLiteral 
  \ start=+"+
  \ skip=+\\"+
  \ end=+"+

syn sync minlines=1000 maxlines=2000

hi def link ldtKeyword Keyword
hi def link ldtStringLiteral String
hi def link ldtCommentL Comment

let b:current_syntax = "ldt"
