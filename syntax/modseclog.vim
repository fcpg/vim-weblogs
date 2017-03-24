" Vim syntax file
" FileType:     Modsecurity debug logs
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   modseclogRuleInfo /\v\[[^]]+\](\s+\[[^]]*\])*/ contains=modseclogInfoMsg,modseclogInfoData
syn match   modseclogReqInfo  /\v^\[[^]]+\]\s+(\[[^]]*\])+\ze\s/ contains=modseclogTime,modseclogHost,modseclogIP,modseclogURI nextgroup=modseclogMsg
syn match   modseclogHost     /\v\[\zs[^]/]+\ze\// contained
syn match   modseclogIP       /\v\[\zs[[:xdigit:].:]+\ze\// contains=modseclogLocal,modseclogLAN contained
syn match   modseclogTime     /\v^\[[^]]+\]/ contained
syn match   modseclogURI      /\v\[\zs\/[^]]+\ze\]/ contained
syn match   modseclogMsg      /\v\s\zs.*\.\ze\s+\[file\s+/ contains=modseclogError,modseclogWarning,modseclogNotice,modseclogInfo nextgroup=modseclogRuleInfo skipwhite
syn match   modseclogError    /Error/ contained
syn match   modseclogWarning  /Warning/ contained
syn match   modseclogNotice   /Notice/ contained
syn match   modseclogInfo     /Info/ contained
syn match   modseclogInfoMsg  /\v\[\zsmsg\s+"[^"]*"\ze\s*\]/ contained
syn match   modseclogInfoData /\v\[\zsdata\s+"[^"]*"\ze\s*\]/ contained
syn match   modseclogLAN      /\v192\.168\.\d+\.\d+/ contained
syn match   modseclogLAN      /\v172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match   modseclogLAN      /\v10\.\d+\.\d+\.\d+/ contained
syn match   modseclogIP       /\v\d10\.\d+\.\d+\.\d+/ contained
syn match   modseclogLocal    /::1|127\.0\.0\.1/ contained

hi link     modseclogReqInfo  Comment
hi link     modseclogRuleInfo Comment
hi link     modseclogIP       Identifier
hi link     modseclogHost     Identifier
hi link     modseclogTime     String
hi link     modseclogURI      Underlined
hi link     modseclogError    ErrorMsg
hi link     modseclogWarning  Statement
hi link     modseclogNotice   Operator
hi link     modseclogInfo     Identifier
hi link     modseclogInfoMsg  Type
hi link     modseclogInfoData Type
hi link     modseclogLocal    Special
hi link     modseclogLAN      PreProc

let b:current_syntax = "modseclog"
