function! s:InitQuickrun()
  nnoremap <buffer> q :q!<CR>
endfunction
autocmd MyAutoCmd FileType quickrun call s:InitQuickrun()
