augroup qfopen-bufenter
  function! s:qfopen_keymap() abort
    nmap <buffer> a <Plug>(qfopen-action)
    nmap <buffer> <C-v> <Plug>(qfopen-open-vsplit)
    nmap <buffer> <C-s> <Plug>(qfopen-open-split)
    nmap <buffer> <C-t> <Plug>(qfopen-open-tab)
    nmap <buffer> v <Plug>(qfopen-open-vsplit)
    nmap <buffer> s <Plug>(qfopen-open-split)
    nmap <buffer> t <Plug>(qfopen-open-tab)
    nnoremap <buffer> q :q!<CR>
  endfunction
  au!
  au FileType qf call s:qfopen_keymap()
augroup END
