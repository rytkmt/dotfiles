let g:sqlfmt_program = "sqlformat --comma_first true -r -k upper -o %s -"

function! s:filetype()
  nmap <buffer> FF <Plug>(sqlfmt)
endfunction

augroup my_sql_autocmdgroup
  autocmd!
  autocmd FileType sql call s:filetype()
augroup END
