" Vim syntax file
" FileType:     Fail2ban log
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match    fail2banlogType       /fail2ban\.\k\+/
syn match    fail2banlogPid        /\[\d\+\]/
syn keyword  fail2banlogError      ERROR
syn keyword  fail2banlogWarning    WARNING
syn keyword  fail2banlogNotice     NOTICE
syn keyword  fail2banlogInfo       INFO
syn match    fail2banlogJail       /\[\K\k*\]/

syn match    fail2banlogIP         /\v\d+\.\d+\.\d+\.\d+/
syn match    fail2banlogBan        /Ban \S\+/
syn match    fail2banlogUnban      /Unban \S\+/
syn match    fail2banlogFound      /Found \S\+/
syn match    fail2banlogIgnore     /Ignore \S\+/

syn match    fail2banlogTimestamp  /^\S\+\s\S\+/ contains=fail2banlogDate,fail2banlogTime
syn match    fail2banlogDate       /\d\{4}-\d\{2}-\d\{2}/ contained transparent
syn match    fail2banlogTime       /\d\{2}:\d\{2}:\d\{2}\(,\d*\)\?/ contained transparent


hi link      fail2banlogTimestamp  String
hi link      fail2banlogPid        Comment
hi link      fail2banlogIP         Number
hi link      fail2banlogJail       Type
hi link      fail2banlogBan        Statement
hi link      fail2banlogUnban      Special
hi link      fail2banlogFound      Identifier
hi link      fail2banlogIgnore     Ignore
hi link      fail2banlogError      ErrorMsg
hi link      fail2banlogWarning    MoreMsg
hi link      fail2banlogNotice     Operator
hi link      fail2banlogInfo       Identifier
hi link      fail2banlogType       Identifier

let b:current_syntax = "fail2banlog"
