" Vim syntax file
" FileType:     PHP error logfile
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   phplogHead          /\v^\[[^]]+\]\s+PHP\s+[^:]+:/ contains=phplogTime,phplogSeverity
syn match   phplogTime          /\v\[[^]]+\]/ contained
syn match   phplogSeverity      /\v\s\zsPHP\s+[^:]+:/ contains=phplogError,phplogWarning,phplogNotice,phplogDebug,phplogDeprecated contained
syn match   phplogError         /\vPHP\s+([^:]*\s)?[eE]rror:/ contained
syn match   phplogWarning       /\vPHP\s+Warning:/ contained
syn match   phplogNotice        /\vPHP\s+Notice:/ contained
syn match   phplogDebug         /\vPHP\s+Debug:/ contained
syn match   phplogDeprecated    /\vPHP\s+Deprecated:/ contained
syn match   phplogLine          /\v\s\zson line \d+/ contains=phplogLineNumber
syn match   phplogLineNumber    /\v[ :]\zs\d+/ contained
syn match   phplogFuncCall      /\v\s\zs\I\i+\([^)]*\)/ contains=phplogFile 
syn match   phplogFile          /\v\/([^ /]*\/)*\S+\.php(:\d+)?/ contains=phplogLineNumber

hi link     phplogIP            Identifier
hi link     phplogTime          String
hi link     phplogPage          Underlined
hi link     phplogResult        Title
hi link     phplogError         Error
hi link     phplogWarning       Special
hi link     phplogNotice        Operator
hi link     phplogDebug         Operator
hi link     phplogDeprecated    Operator
hi link     phplogFile          Underlined
hi link     phplogLine          Comment
hi link     phplogLineNumber    Number
hi link     phplogFuncCall      Identifier 

hi link     phplogLocal         Special
hi link     phplogLAN           PreProc
hi link     phplogMD5           Comment

let b:current_syntax = "phplog"
