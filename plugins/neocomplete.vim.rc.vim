" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 1
" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
autocmd MyAutoCmd InsertLeave * silent! pclose!

let g:neocomplete#max_keyword_width = 10000

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
  endif
  let g:neocomplete#delimiter_patterns.ruby = ['::']
let s:neco_dicts_dir = $VIM . '/bundle/dotfiles/dicts'
if isdirectory(s:neco_dicts_dir)
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'ruby': s:neco_dicts_dir . '/ruby.dict'
  \ }
endif

unlet s:neco_dicts_dir
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'
"候補の選択
imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr><C-l>  neocomplete#complete_common_string() != '' ? neocomplete#complete_common_string() : "\<Right>"
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
exe ":NeoCompleteEnable"
