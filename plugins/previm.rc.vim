augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" Previm
if has('win32')
  let g:previm_open_cmd = 'C:\\Users\\r_tsukamoto.ILL\\AppData\\Local\\Vivaldi\\Application\\vivaldi.exe'
elseif has('mac')
  let g:previm_open_cmd = ''
elseif has('unix')
  let g:previm_open_cmd = ''
end
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
