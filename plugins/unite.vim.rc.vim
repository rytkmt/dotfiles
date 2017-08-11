" let g:unite_source_history_yank_enable =1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

" 入力モードで開始する
" let g:unite_enable_start_insert=1

"nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
" nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
" nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
call unite#custom_default_action('source/bookmark/directory' , 'lcd')
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
" nnoremap <silent> [unite]y :<C-u>Unite<Space>history/yank<CR>
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
function! CallUniteFileRec()
  if exists('w:current_project')
    exe ':Unite file_rec -start-insert -path=' .w:current_project
  else
    echo 'not found project!'
  endif
endfunction
nnoremap <silent> [unite]r :<C-u>call CallUniteFileRec()<CR>
"nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" nnoremap <silent> [unite]r :UniteResume search-buffer<CR>
" nnoremap <silent> [unite]f :<C-u>Unite<Space>file/new<CR>
" nnoremap <silent> [unite]d :<C-u>Unite<Space>directory/new<CR>
"uniteを開いている間のキーマッピング
autocmd MyAutoCmd  FileType unite call s:unite_settings()
function! s:unite_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "ctrl+sで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  "ctrl+v横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')

  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
