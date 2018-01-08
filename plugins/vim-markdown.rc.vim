let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
autocmd MyAutoCmd FileType markdown setlocal conceallevel=0
autocmd MyAutoCmd FileType markdown setlocal nofoldenable

"キーマップ
autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]x :HeaderDecrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]x <S-v>:HeaderDecrease<CR>

autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]a :HeaderIncrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]a <S-v>:HeaderIncrease<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]t :TableFormat<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]c :Toc<CR>

