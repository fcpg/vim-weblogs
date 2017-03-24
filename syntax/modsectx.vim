" Vim syntax file
" FileType:     ModSecurity Transaction Log
" Author:       fcpg
" Version:      1.0
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match   modsectxHeader   /\v^--[a-zA-Z0-9]+-[A-Z]--$/ contains=modsectxPartName
syn match   modsectxPartName /\v-\zs[A-Z]\ze-/ contained
syn match   modsectxALine    /\v^\[[^]]+\] [[:alnum:]]+ [[:xdigit:].:]+ \d+ [[:xdigit:].:]+ \d+$/ contains=modsectxTime,modsectxIP,modsectxPortNum

syn match   modsectxHTTPHdr  /\v^[[:alnum:]-]+: .*$/ contains=modsectxHHName
syn match   modsectxHHName   /\v^[[:alnum:]-]+:\ze / contained
syn match   modsectxUALine   /\v^User-Agent: .*$/ contains=modsectxHHName
syn match   modsectxMSGLine  /\v^Message: .*$/ contains=modsectxHHName,modsectxFile,modsectxKeyword,modsectxIDPart,modsectxMsgPart,modsectxRuleArg

syn keyword modsectxKeyword  file line tag severity ver maturity data accuracy
syn keyword modsectxRuleArg  ARGS ARGS_COMBINED_SIZE ARGS_GET ARGS_GET_NAMES ARGS_NAMES ARGS_POST ARGS_POST_NAMES AUTH_TYPE DURATION ENV FILES FILES_COMBINED_SIZE FILES_NAMES FULL_REQUEST FULL_REQUEST_LENGTH FILES_SIZES FILES_TMPNAMES FILES_TMP_CONTENT GEO HIGHEST_SEVERITY INBOUND_DATA_ERROR MATCHED_VAR MATCHED_VARS MATCHED_VAR_NAME MATCHED_VARS_NAMES MODSEC_BUILD MULTIPART_CRLF_LF_LINES MULTIPART_FILENAME MULTIPART_NAME MULTIPART_STRICT_ERROR MULTIPART_UNMATCHED_BOUNDARY OUTBOUND_DATA_ERROR PATH_INFO PERF_COMBINED PERF_GC PERF_LOGGING PERF_PHASE1 PERF_PHASE2 PERF_PHASE3 PERF_PHASE4 PERF_PHASE5 PERF_RULES PERF_SREAD PERF_SWRITE QUERY_STRING REMOTE_ADDR REMOTE_HOST REMOTE_PORT REMOTE_USER REQBODY_ERROR REQBODY_ERROR_MSG REQBODY_PROCESSOR REQUEST_BASENAME REQUEST_BODY REQUEST_BODY_LENGTH REQUEST_COOKIES REQUEST_COOKIES_NAMES REQUEST_FILENAME REQUEST_HEADERS REQUEST_HEADERS_NAMES REQUEST_LINE REQUEST_METHOD REQUEST_PROTOCOL REQUEST_URI REQUEST_URI_RAW RESPONSE_BODY RESPONSE_CONTENT_LENGTH RESPONSE_CONTENT_TYPE RESPONSE_HEADERS RESPONSE_HEADERS_NAMES RESPONSE_PROTOCOL RESPONSE_STATUS RULE SCRIPT_BASENAME SCRIPT_FILENAME SCRIPT_GID SCRIPT_GROUPNAME SCRIPT_MODE SCRIPT_UID SCRIPT_USERNAME SDBM_DELETE_ERROR SERVER_ADDR SERVER_NAME SERVER_PORT SESSION SESSIONID STREAM_INPUT_BODY STREAM_OUTPUT_BODY TIME TIME_DAY TIME_EPOCH TIME_HOUR TIME_MIN TIME_MON TIME_SEC TIME_WDAY TIME_YEAR TX UNIQUE_ID URLENCODED_ERROR USERID USERAGENT_IP WEBAPPID WEBSERVER_ERROR_LOG XML
syn match   modsectxIDPart   /\v\[\zsid "\d+"\ze\]/ contains=modsectxID
syn match   modsectxID       /\v"\zs\d+\ze"/
syn match   modsectxMSGPart  /\v\[\zsmsg "[^"]+"\ze\]/ contains=modsectxMsg
syn match   modsectxMsg      /\v"[^"]+"/

syn match   modsectxIP       /\v[[:xdigit:].:]+\ze\s/ contains=modsectxLocal,modsectxLAN contained
syn match   modsectxPortNum  /\v\s\zs\d+\ze(\s|$)/ contained 
syn match   modsectxTime     /\v(\s|^)\zs\[[^]]+\]\ze\s/ contained

syn match   modsectxURI      /\v\s\zs\/\S*\ze(\s|$)/ contained
syn match   modsectxFile     /\v"\zs\/[^"]*\ze"/ contained

syn match   modsectxReqLine  /\v^(GET|POST|HEAD|PUT|DELETE|CONNECT|OPTIONS|PATCH|TRACE) \/\S* \S+$/ contains=modsectxURI
syn match   modsectxResLine  /\v^HTTP\/\d\.\d \d+ .*/ contains=modsectxResult
syn match   modsectxResult   /\v\s\zs[1-5]\d{2}\ze\s/ contains=modsectxError,modsectxDeny,modsectxRedir contained
syn match   modsectxError    /\v5\d{2}/ contained
syn match   modsectxDeny     /\v4\d{2}/ contained
syn match   modsectxRedir    /\v3\d{2}/ contained
syn match   modsectxNumber   /\v\s\zs[1-4]\d{2}\ze\s/


syn match   modsectxLAN      /\v192\.168\.\d+\.\d+/ contained
syn match   modsectxLAN      /\v172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match   modsectxLAN      /\v10\.\d+\.\d+\.\d+/ contained
syn match   modsectxIP       /\v\d10\.\d+\.\d+\.\d+/ contained
syn match   modsectxLocal    /::1|127\.0\.0\.1/ contained

hi link     modsectxHeader   Statement
hi link     modsectxPartName Title
hi link     modsectxPortNum  Number
hi link     modsectxURI      Underlined
hi link     modsectxFile     Underlined
hi link     modsectxHHName   Type
hi link     modsectxReqLine  Identifier
hi link     modsectxResLine  Identifier
hi link     modsectxUALine   Comment
hi link     modsectxMSGLine  Operator
hi link     modsectxKeyword  Comment
hi link     modsectxRuleArg  Normal
hi link     modsectxIDPart   Identifier
hi link     modsectxID       Number
hi link     modsectxMSGPart  Identifier
hi link     modsectxMSG      String

hi link     modsectxIP       Identifier
hi link     modsectxTime     String
hi link     modsectxResult   Title
hi link     modsectxError    Error
hi link     modsectxDeny     Operator
hi link     modsectxRedir    Special
hi link     modsectxLocal    Special
hi link     modsectxLAN      PreProc

let b:current_syntax = "modsectx"
