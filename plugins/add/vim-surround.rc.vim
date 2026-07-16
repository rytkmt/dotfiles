" #
autocmd FileType ruby let b:surround_{char2nr("#")} = "#{\r}"
autocmd FileType eruby let b:surround_{char2nr("%")} = "<% \r %>"
autocmd FileType eruby let b:surround_{char2nr("=")} = "<%= \r %>"
let g:surround_{char2nr("」")} = "「\r」"
let g:surround_{char2nr("「")} = "「\r」"
let g:surround_{char2nr("【")} = "【\r】"
let g:surround_{char2nr("】")} = "【\r】"
