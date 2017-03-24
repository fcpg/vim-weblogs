" Vim syntax file
" FileType:     Error log of Apache, nginx, etc
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   httplogerrorTime     /\v^\zs\[[^]]+\]\ze\s/
syn match   httplogerrorError    /\v\s\zs\[\w+\]\ze\s/
syn match   httplogerrorClient   /\v\s\zs\[client\s+[[:xdigit:].:]+\]\ze\s/ contains=httplogerrorIP
syn match   httplogerrorRef      /\v\s\zsreferer: .*\ze/ contains=httplogerrorURI
syn match   httplogerrorURI      /\vhttps?:\S+/ contained
syn match   httplogerrorIP       /\v\zs\d+\.\d+\.\d+\.\d+\ze/ contained contains=httplogerrorLocal,httplogerrorLAN
syn match   httplogerrorLAN      /\v192\.168\.\d+\.\d+/ contained
syn match   httplogerrorLAN      /\v172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match   httplogerrorLAN      /\v10\.\d+\.\d+\.\d+/ contained
syn match   httplogerrorIP       /\v\d10\.\d+\.\d+\.\d+/ contained
syn match   httplogerrorLocal    /\v127\.0\.0\.1/ contained
syn match   httplogerrorExist    /\v\s\zsFile does not exist: .*\ze/ contains=httplogerrorPath,httplogerrorRef
syn match   httplogerrorDir      /\v\s\zsAttempt to serve directory: .*\ze/ contains=httplogerrorPath
syn match   httplogerrorPath     /\v\s\zs\/\S*/ contained

hi link     httplogerrorClient   Identifier
hi link     httplogerrorTime     Comment
hi link     httplogerrorResult   Title
hi link     httplogerrorError    ErrorMsg
hi link     httplogerrorRef      Statement
hi link     httplogerrorURI      Underlined
hi link     httplogerrorUA       Comment
hi link     httplogerrorLocal    Special
hi link     httplogerrorLAN      PreProc
hi link     httplogerrorIP       Number
hi link     httplogerrorExist    Type
hi link     httplogerrorPath     String
hi link     httplogerrorDir      Normal

let b:current_syntax = "httplogerror"
