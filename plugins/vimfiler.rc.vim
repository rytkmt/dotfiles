call vimfiler#custom#profile('default', 'context', {
\   'safe' : 0,
\   'fnamewidth' : -1,
\   'winheight' : 100,
\   'winwidth' : 30
\ })

let g:vimfiler_tab_cnt = 1
let g:vimfiler_is_new = 1
function! _VimFilerOpen(init, type)
  if !exists("t:tab_name")
    " タブ番号保持
    let t:tab_name = g:vimfiler_tab_cnt
    let g:vimfiler_tab_cnt = g:vimfiler_tab_cnt + 1
  endif

  let l:open_cmd = ":VimFilerExplorer -buffer-name=" . t:tab_name
  let l:vimfiler_default_dir = ''

  if a:type == 1 && (a:init || g:vimfiler_is_new)
    let g:vimfiler_is_new = 0
    let l:vimfiler_default_dir = $FILER_DEFAULT
    if empty(l:vimfiler_default_dir)
      let l:vimfiler_default_dir = $XDG_CONFIG_HOME
    endif
    if !isdirectory(l:vimfiler_default_dir)
      let l:vimfiler_default_dir = $HOME
    endif
    exe l:open_cmd . " " . fnamemodify(l:vimfiler_default_dir, ':p')
  elseif a:type == 1
    exe l:open_cmd
  elseif a:type == 2
    " カレントディレクトリ
    let l:vimfiler_default_dir = expand("%:p:h")
    exe l:open_cmd . " " . fnamemodify(l:vimfiler_default_dir, ':p')
  elseif a:type == 3
    " カレントディレクトリ
    let l:vimfiler_default_dir = expand("%:p:h")
    exe l:open_cmd . " " . fnamemodify(l:vimfiler_default_dir, ':p')
  endif
endfunction

nmap [filer]f :<C-u>call _VimFilerOpen(0,1)<CR>
nmap [filer]d :<C-u>call _VimFilerOpen(1,1)<CR>
nmap [filer]b :<C-u>call _VimFilerOpen(1,2)<CR>
nmap [filer]u :<C-u>call _VimFilerOpen(1,3)<CR>

let g:vimfiler_no_default_key_mappings = 1

let g:vimfiler_as_default_explorer = 1
" アイコンの見た目変更
let g:vimfiler_marked_file_icon = '*'
" let g:vimfiler_tree_leaf_icon = ' '
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = '-'

"ゴミ箱の使用
let g:unite_kind_file_use_trashbox = 1
let g:vimfiler_enable_auto_cd = 1

" 無視リスト
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^\.svn', '\~$', '\.bak$']

autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()

function! ExpressionAndFilerClose(cmd)
  let l:cmd = ""
  if !empty(a:cmd)
    let l:cmd = eval(a:cmd)
  endif
  return  l:cmd . printf(":\<C-u>VimFilerClose %s\<CR>", t:tab_name)
endfunction

function! s:vimfiler_settings()
  setlocal nonumber
  setlocal nocursorcolumn
  " 移動
  nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)

  nnoremap <buffer><silent> <Plug>(vimfiler_edit_file)
        \ :<C-u>call vimfiler#mappings#do_switch_action(
        \   b:vimfiler, b:vimfiler.context.edit_action)<CR>
        \ :<C-u>call vimfiler#mappings#close(t:tab_name)<CR>

  nmap <buffer> l <Plug>(vimfiler_smart_l)
  nmap <buffer> <CR> l

  nmap <buffer><expr> L vimfiler#smart_cursor_map(
          \ "\<Plug>(vimfiler_cd_file)",
          \ "\<Plug>(vimfiler_open_file_in_another_vimfiler)")

  " ウィンドウを分割して開く
  nmap <silent><buffer><expr> s ExpressionAndFilerClose("vimfiler#do_switch_action('split')")
  nmap <silent><buffer><expr> v ExpressionAndFilerClose("vimfiler#do_switch_action('vsplit')")
  nmap <silent><buffer><expr> t ExpressionAndFilerClose("vimfiler#do_switch_action('tabopen')")
  nmap <buffer> <C-v> v
  nmap <buffer> <C-s> s
  nmap <buffer> <C-t> t

  nmap <buffer> h <Plug>(vimfiler_smart_h)
  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)
  nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
  nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
  nmap <buffer> & <Plug>(vimfiler_switch_to_project_directory)

  " 閉じる
  nmap <buffer> q <Plug>(vimfiler_hide)
  nmap <buffer> Q <Plug>(vimfiler_exit)

  " 特殊
  " 隠しファイル表示・非表示
  nmap <buffer> . <Plug>(vimfiler_toggle_visible_ignore_files)
  " 外部のプログラムで実行
  nmap <buffer> X <Plug>(vimfiler_execute_system_associated)
  " エクスプローラーで開く
  nmap <buffer> E <Plug>(vimfiler_execute_external_filer)
  " シェルの起動
  nmap <buffer> SH <Plug>(vimfiler_popup_shell)
  " 外部コマンドの実行
  nmap <buffer> ! <Plug>(vimfiler_execute_shell_command)
  " 追加アクション
  nmap <buffer> A <Plug>(vimfiler_choose_action)
  " ブックマーク
  nmap <silent><buffer><expr> B vimfiler#do_action('bookmark')
  " ヘルプ
  nmap <buffer> ? <Plug>(vimfiler_help)
  " findコマンド
  nmap <buffer> F <Plug>(vimfiler_find)
  " cd
  nmap <buffer> cd <Plug>(vimfiler_cd_vim_current_dir)
  " safeモード切り替え
  nmap <buffer> gs <Plug>(vimfiler_toggle_safe_mode)
  nmap <buffer> gS <Plug>(vimfiler_toggle_simple_mode)
  nnoremap <silent><buffer> b :<C-u>Unite<Space>bookmark<CR>
  " maskモード
  nmap <buffer> M <Plug>(vimfiler_set_current_mask)

  " マーク
  nmap <buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
  vmap <buffer> <Space> <Plug>(vimfiler_toggle_mark_selected_lines)
  nmap <buffer> * <Plug>(vimfiler_toggle_mark_all_lines)
  nmap <buffer> C <Plug>(vimfiler_clear_mark_all_lines)

  " ファイル編集
  nmap <buffer> mc <Plug>(vimfiler_copy_file)
  nmap <buffer> mm <Plug>(vimfiler_move_file)
  nmap <buffer> md <Plug>(vimfiler_delete_file)
  nmap <buffer> df <Plug>(vimfiler_delete_file)
  nmap <buffer> mr <Plug>(vimfiler_rename_file)

  " ファイル作成
  nmap <buffer> ad <Plug>(vimfiler_make_directory)
  nmap <buffer> af <Plug>(vimfiler_new_file)

  " ファイルクリップ
  nmap <buffer> cc <Plug>(vimfiler_clipboard_copy_file)
  nmap <buffer> cm <Plug>(vimfiler_clipboard_move_file)
  nmap <buffer> cp <Plug>(vimfiler_clipboard_paste)
  nmap <buffer> yy <Plug>(vimfiler_yank_full_path)

  " マークは，<S-Space>
  nmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
  vmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_selected_lines)

  " 全角スペースのハイライトをオフ
  let b:zenkaku_hilight_off = 1
endfunction

