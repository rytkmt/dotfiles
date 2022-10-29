function! s:OpenQuickfix()
  set modifiable
  setl errorformat=%f\|%l\ col\ %c\|\ %m
endfunction

autocmd MyAutoCmd QuickFixCmdPost * cw | call s:OpenQuickfix()

function! s:SaveQuickfixResult(...)
  if !exists('g:quickfix_saved_results')
    let g:quickfix_saved_results = {}
  endif

  let l:filename = tempname()
  exe ":w " .l:filename

  let l:name = "( no name )"
  if exists("a:1")
    let l:name = a:1
  endif

  let g:quickfix_saved_results[split(l:filename, '/')[-1]] = {
 \  'path' : l:filename,
 \  'name' : l:name
 \}
endfunction
command! -nargs=? SaveQuickfixResult call s:SaveQuickfixResult(<f-args>)

function! s:ShowSavedQuickfixResults()
  if !exists('g:quickfix_saved_results')
    echo 'no data.'
    return
  endif

  let l:display_rows = []
  for l:key in keys(g:quickfix_saved_results)
    let l:result = g:quickfix_saved_results[l:key]
    call add(l:display_rows, l:key .'  :  ' .l:result.name)
  endfor
  echo join(l:display_rows, "\n")
endfunction
command! ShowSavedQuickfixResults call s:ShowSavedQuickfixResults()

function! s:ReadQuickfixResult(id)
  if !exists('g:quickfix_saved_results')
    echo 'no data.'
    return
  endif

  if !has_key(g:quickfix_saved_results, a:id)
    echo 'no match data.'
    return
  endif

  let l:file = g:quickfix_saved_results[a:id].path
  let l:name = g:quickfix_saved_results[a:id].name
  let l:qf = s:FileToDictionary(l:file, l:name)
  if !(len(l:qf) > 0)
    echo 'no load data'
    return
  endif
  call setqflist(l:qf)
  exe ":copen 10"
endfunction
command! -nargs=? ReadQuickfixResult call s:ReadQuickfixResult(<f-args>)

function! s:FileToDictionary(file, name)
  if !filereadable(a:file)
    return {}
  endif

  let l:file = readfile(a:file)
  let l:qf = []
  try
    for l:row in l:file
      let r_file = substitute(l:row, '|.*$', '','')
      let r_lnum = str2nr(matchstr(l:row, '|\zs\d\+'))
      let r_text = substitute(l:row, '^.\{-}|.\{-}|', '', '')
      call add(qf, {'name' : a:name, 'filename' : r_file, 'lnum' : r_lnum, 'text' : r_text})
    endfor
    return l:qf
  catch
    return {}
  endtry
endfunction

nnoremap <buffer> q :q!<CR>
nnoremap <buffer> <C-Enter> <C-w><Enter>
nnoremap <buffer> [ft]s :SaveQuickfixResult
nnoremap <buffer> [ft]l :ShowSavedQuickfixResults<CR>
nnoremap <buffer> [ft]r :ReadQuickfixResult<CR>
