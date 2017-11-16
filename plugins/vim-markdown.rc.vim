let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
setlocal conceallevel=0
setlocal nofoldenable

"キーマップ
autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]x :HeaderDecrease<CR>
vmap <buffer> <C-x> :HeaderDecrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]x <S-v>:HeaderDecrease<CR>
nmap <buffer> <C-x> <S-v>:HeaderDecrease<CR>

autocmd MyAutoCmd FileType markdown vmap <buffer> [ft]a :HeaderIncrease<CR>
vmap <buffer> <C-a> :HeaderIncrease<CR>
autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]a <S-v>:HeaderIncrease<CR>
nmap <buffer> <C-a> <S-v>:HeaderIncrease<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]t :TableFormat<CR>
nmap <buffer> [ft]t :TableFormat<CR>

autocmd MyAutoCmd FileType markdown nmap <buffer> [ft]c :Toc<CR>
nmap <buffer> [ft]c :Toc<CR>

