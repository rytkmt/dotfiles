augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" Previm
if has('win32')
  let g:previm_open_cmd = 'C:\\Users\\r_tsukamoto.ILL\\AppData\\Local\\Vivaldi\\Application\\vivaldi.exe'
elseif has('mac')
  let g:previm_open_cmd = '/Applications/Vivaldi.app/Contents/MacOS/Vivaldi'
elseif has('unix')
  let g:previm_open_cmd = ''
end
autocmd MyAutoCmd FileType markdown,textile nnoremap <buffer> <silent> [ft]o :<C-u>PrevimOpen<CR>
autocmd MyAutoCmd FileType markdown,textile nnoremap <buffer> <silent> [ft]r :call previm#refresh()<CR>
