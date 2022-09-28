" function! s:to_upper_case_sql
"   let a:tmp = @@
"   silent normal gvy
"   let a:selected = @@
"   let @@ = a:tmp
"
"   let l:after_str = substitute(a:selected, "\\v(^|\\s)(all|analyse|analyze|and|any|array|as|asc|asymmetric|authorization|by|binary|case|cast|column|concurrently|constraint|create|cross|current_catalog|current_date|current_role|current_schema|current_time|current_timestamp|current_user|default|desc|distinct|do|else|end|fetch|for|foreign|freeze|from|full|group|having|ilike|in|initially|inner|into|is|isnull|join|leading|left|like|limit|natural|not|notnull|null|offset|on|or|order|outer|placing|primary|references|right|select|similar|table|then|to|union|unique|using|when|where|with)(\\s|$)", "\\U\\0", "gI")
"   echo l:after_str
"   execute "normal s" . l:after_str
" endfunction
" command! -nargs=? ToUpperCaseSQL call s:to_upper_case_sql
