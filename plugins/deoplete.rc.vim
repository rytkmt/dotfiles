" 起動時に有効化
let g:deoplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
" ポップアップメニューで表示される候補の数
let g:deoplete#max_list = 20
" 補完を表示する最小文字数
let g:deoplete#auto_complete_start_length = 1
" 補完する秒数
let g:deoplete#auto_complete_delay = 200
let g:deoplete#auto_autorefresh_delay = 800
let g:deoplete#file#enable_buffer_path = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : deoplete#manual_complete()
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr><C-l>
\ deoplete#complete_common_string() != '' ?
\   deoplete#complete_common_string() : "\<Right>"
call deoplete#enable()

