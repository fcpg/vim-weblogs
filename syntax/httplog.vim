" Vim syntax file
" FileType:     Access log of Apache, nginx, etc
" Author:       fcpg
" Credits:      lilydjwg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   httplogUA       /\v\s\zs"[^"]+"/ contains=httplogBrowser
syn match   httplogIPFirst  /\v^[[:xdigit:].:]+\ze\s/ contains=httplogIP
syn match   httplogIPSecond /\v^\S+\s[[:xdigit:].:]+\ze\s/ contains=httplogIP,httplogDomain
syn match   httplogDomain   /\v\k+/ contained
syn match   httplogIP       /\v[[:xdigit:].:]+\ze\s/ contains=httplogLocal,httplogLAN contained
syn match   httplogTime     /\v\s\zs\[[^]]+\]\ze\s/
syn match   httplogPage     /\v\s\zs"(GET|POST|HEAD|PUT|DELETE|CONNECT|OPTIONS|PATCH|TRACE) [^"]+"\ze\s/ nextgroup=httplogResult skipwhite
syn match   httplogResult   /\v\s\zs[1-5]\d{2}\ze\s/ contains=httplogError,httplogDeny,httplogRedir contained
syn match   httplogError    /\v5\d{2}/ contained
syn match   httplogDeny     /\v4\d{2}/ contained
syn match   httplogRedir    /\v3\d{2}/ contained
syn match   httplogResult   /\v412/    contained
syn match   httplogNumber   /\v\s\zs[1-4]\d{2}\ze\s/
syn match   httplogRef      /\v\s\zs"(http[^"]+|-)"\ze\s/
syn match   httplogBrowser  /\<UCWEB\d\@=/
syn match   httplogBrowser  /\v(".*Chrome.*)@<!<Safari>/
syn match   httplogBrowser  /\v(".*%(Chrom|Google Web Preview).*)@<!<Chrome>(.*Chrome.*")@!/
syn match   httplogBrowser  /\<Feedfetcher-Google\>/
syn match   httplogBrowser  /\<Google Web Preview\>/
syn match   httplogBrowser  "\<bingbot\>/\@="
syn match   httplogBrowser  /\<Sogou web spider\>/
syn keyword httplogBrowser  Firefox MSIE Konqueror Chromium ChromePlus Opera w3m Wget aria2 Lynx Epiphany Links TheWorld contained
syn keyword httplogBrowser  gvfs curl pacman PackageKit contained
syn keyword httplogBrowser  Googlebot Baiduspider Sosospider YandexBot W3C_Validator Jigsaw PhantomJS ia_archiver contained
syn match   httplogLAN      /\v192\.168\.\d+\.\d+/ contained
syn match   httplogLAN      /\v172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match   httplogLAN      /\v10\.\d+\.\d+\.\d+/ contained
syn match   httplogIP       /\v\d10\.\d+\.\d+\.\d+/ contained
syn match   httplogLocal    /::1|127\.0\.0\.1/ contained
syn match   httplogMD5      /\v\s\zsmd5:\x+/
syn match   httplogSSL      /\v\s\zsTLSv1\.\d/ 

hi link     httplogIP       Identifier
hi link     httplogTime     String
hi link     httplogPage     Underlined
hi link     httplogResult   Title
hi link     httplogError    Error
hi link     httplogDeny     Operator
hi link     httplogRedir    Special
hi link     httplogRef      Statement
hi link     httplogUA       Comment
hi link     httplogBrowser  String
hi link     httplogLocal    Special
hi link     httplogLAN      PreProc
hi link     httplogMD5      Comment
hi link     httplogSSL      Identifier

let b:current_syntax = "httplog"
