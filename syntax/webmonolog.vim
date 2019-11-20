" Vim syntax file
" FileType:     Output of Monolog Webprocessor
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   webmonologTime       /\v^\zs\[[^]]+\]\ze\s/
syn match   webmonologLevel      /\v\s\zs\u+\.\u+\ze[\s:]/ contains=webmonologLevelInfo,webmonologLevelWarn,webmonologLevelErr

syn match   webmonologLevelInfo  /\v(DEBUG|INFO|NOTICE)/ contained
syn match   webmonologLevelWarn  /\v(WARNING|WARN)/ contained
syn match   webmonologLevelErr   /\v(ERROR|ERR|CRITICAL|CRIT|EMERGENCY|EMERG)/ contained

syn match   webmonologFunction   /\v\s\zs\i+\(\)\ze[\s:]/

syn match   webmonologContext    /\v\s\zs\{.*\}\s*$/ contains=webmonologKV,webmonologKVIP,webmonologKVURL,webmonologKVUID

syn match   webmonologKV         /\v"[^"]*"\s*:\s*"[^"]*"/ contained transparent
syn match   webmonologKVIP       /\v"[iI][pP]"\s*:\s*"[^"]*"/ contained contains=webmonologIP transparent
syn match   webmonologKVURL      /\v"[uU][rR][lL]"\s*:\s*"[^"]*"/ contained contains=webmonologURL transparent
syn match   webmonologKVUID      /\v"[uU][nN][iI][qQ][uU][eE]_[iI][dD]"\s*:\s*"[^"]*"/ contained contains=webmonologUID transparent

syn match   webmonologIP         /\v\zs\d+\.\d+\.\d+\.\d+\ze/ contained contains=webmonologLocal,webmonologLAN
syn match   webmonologLAN        /\v192\.168\.\d+\.\d+/ contained
syn match   webmonologLAN        /\v172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match   webmonologLAN        /\v10\.\d+\.\d+\.\d+/ contained
syn match   webmonologIP         /\v\d10\.\d+\.\d+\.\d+/ contained
syn match   webmonologLocal      /\v127\.0\.0\.1/ contained
syn match   webmonologLocal      /\v::1/ contained

syn match   webmonologURL        /\v:\s*"\zs[^"]*\ze"/ contained
syn match   webmonologUID        /\v:\s*"\zs[^"]*\ze"/ contained


hi link webmonologTime       Comment
"hi link webmonologTime       Title

hi link webmonologLevel      Identifier
hi link webmonologLevelWarn  WarningMsg
hi link webmonologLevelErr   ErrorMsg

hi link webmonologFunction   Statement

hi link webmonologContext    String

hi link webmonologURL        Underlined
hi link webmonologUID        Identifier

hi link webmonologLocal      Special
hi link webmonologLAN        PreProc
hi link webmonologIP         Number

let b:current_syntax = "webmonolog"
