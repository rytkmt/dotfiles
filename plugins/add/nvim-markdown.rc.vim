let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_no_default_key_mappings = 1

autocmd MyAutoCmd FileType markdown setlocal nofoldenable

"キーマップ
autocmd MyAutoCmd FileType markdown nmap <buffer> ]h <Plug>Markdown_MoveToNextHeader
autocmd MyAutoCmd FileType markdown nmap <buffer> [h <Plug>Markdown_MoveToPreviousHeader

autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]x :HeaderDecrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]x <S-v>:HeaderDecrease<CR>

autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]a :HeaderIncrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]a <S-v>:HeaderIncrease<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]t :TableFormat<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]c :Toc<CR>
autocmd MyAutoCmd FileType markdown setlocal comments=nb:> comments+=b:*\ [\ ],b:*\ [x],b:* comments+=b:+\ [\ ],b:+\ [x],b:+ comments+=b:-\ [\ ],b:-\ [x],b:- comments+=b:1.\ [\ ],b:1.\ [x],b:1. formatoptions-=c formatoptions+=jro conceallevel=0

" function! s:auto_save()
"   if filewritable(expand('%'))
"     write!
"   endif
" endfunction
"
" autocmd MyAutoCmd InsertLeave *.md call <SID>auto_save()
