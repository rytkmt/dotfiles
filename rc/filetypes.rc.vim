function! s:define_filetype_setter(ft, ...)
  if len(a:000) > 0
    exe "autocmd BufRead,BufNewFile ". join(a:000, ","). " set filetype=". a:ft
  else
    echom "arguments count must be greater than 2"
  endif
endfunction

call s:define_filetype_setter("ruby", "*.schema")
