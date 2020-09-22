let g:ctrlp_map = '[ctrlp]f'
" nmap [ctrlp]f :<C-u>CtrlP<CR>
nmap [ctrlp]b :<C-u>CtrlPBuffer<CR>
nmap [ctrlp]m :<C-u>CtrlPMRU<CR>

" キャッシュディレクトリ
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0
" scanする最大ファイル数
let g:ctrlp_max_files = 10000
" mruの最大保存数
let g:ctrlp_mruf_max = 50
" 遅延再描画
let g:ctrlp_lazy_update = 1
" ルートパスと認識させるためのファイル
let g:ctrlp_root_markers = ['Gemfile', 'Rakefile']
" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20
" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|jar|gif|png|jpeg|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


autocmd FileType ctrlp call s:ctrlp_my_settings()
