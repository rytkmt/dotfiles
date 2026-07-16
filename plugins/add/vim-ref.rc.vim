" vim-ref のバッファを q で閉じられるようにする
autocmd MyAutoCmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" 辞書定義
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'https://translate.google.co.jp/?hl=en#view=home&op=translate&sl=ja&tl=en&text=%s',
\   },
\   'je2': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'https://translate.google.co.jp/?hl=en#view=home&op=translate&sl=en&tl=ja&text=%s',
\   },
\   'ej2': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\ }

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

" 出力に対するフィルタ
" 最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction

function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction

nmap <expr> [lib]j ':Ref webdict je<Space>'
nmap <expr> [lib]e ':Ref webdict ej '.expand("<cword>")
nmap <expr> [lib]J ':Ref webdict je2<Space>'
nmap <expr> [lib]E ':Ref webdict ej2 '.expand("<cword>")
