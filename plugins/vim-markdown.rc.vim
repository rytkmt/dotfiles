let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
setlocal conceallevel=0
setlocal nofoldenable

"キーマップ
autocmd MyAutoCmd FileType markdown vmap <buffer> [map]x :HeaderDecrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [map]x <S-v>:HeaderDecrease<CR>

autocmd MyAutoCmd FileType markdown vmap <buffer> [map]a :HeaderIncrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [map]a <S-v>:HeaderIncrease<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]t :TableFormat<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]c :Toc<CR>

