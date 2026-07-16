augroup qfopen-bufenter
  " Quickfixリストの項目を開いてリストから削除する関数
  function! s:OpenAndRemoveFromQuickfix()
    let l:qf_winnr = winnr()
    " 現在のQuickfixリストのインデックスを取得
    let l:qf_index = line('.')
    echom l:qf_index

    " Quickfixリストから項目を開く
    execute "cc" . l:qf_index
    let l:target_winnr = winnr()
    " Quickfixリストから項目を削除する
    let l:qflist = getqflist()
    call remove(l:qflist, l:qf_index - 1)
    " Quickfixリストを更新
    call setqflist(l:qflist)
    execute l:qf_winnr.'wincmd w'
    execute l:qf_index
    execute 'normal! zz'
    execute l:target_winnr.'wincmd w'
    execute 'normal! zz'
  endfunction

  function! s:qfopen_keymap() abort
    setl cursorline
    nmap <buffer> <CR> <CR>zz
    nmap <buffer> g<CR> :call <SID>OpenAndRemoveFromQuickfix()<CR>
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
