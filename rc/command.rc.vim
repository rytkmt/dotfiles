" ++ 一時ファイル {{{
function! s:make_tempfile(win, ...)
  let l:win = (a:win == 0 ? "e" : (a:win == 1 ? "vs" : "sp"))
  exe l:win ." " .tempname()
  if exists("a:1") && a:1 != ""
    exe "set ft=" .a:1
  endif
  autocmd MyAutoCmd BufLeave <buffer> write
endfunction

command! -nargs=? Tempe call s:make_tempfile(0, "<args>")
command! -nargs=? Temp call s:make_tempfile(1, "<args>")
command! -nargs=? Temps call s:make_tempfile(2, "<args>")
" ++ }}}

" ++ カレントディレクトリをエクスプローラーで開く {{{
function! s:open_current_explorer()
  if has('mac')
    exe "silent ! open %:h"
  else
    exe "silent ! start %:h"
  endif
endfunction
command! OpenCurrentExplorer call s:open_current_explorer()
" ++ }}}

" ++ ケース変換 {{{
function! s:separate_word(str)
  return split( substitute(a:str, "\\L", "_\\l\\0", "gI"), "_")
endfunction

function! s:to_camel_case(is_lower, before_str)
  let l:words = s:separate_word(a:before_str)
  let l:after_str = ""
  if a:is_lower
    let l:after_str = remove(l:words, 0)
  endif

  for l:word in l:words
    let l:after_str = l:after_str . substitute(l:word, "^.", "\\u\\0", "")
  endfor
  execute "normal viws" . l:after_str
endfunction
command! -nargs=? ToCamelCase call s:to_camel_case(1, <f-args>)
command! -nargs=? ToPascalCase call s:to_camel_case(0, <f-args>)

function! s:to_snake_case(before_str)
  let l:words = s:separate_word(a:before_str)
  let l:after_str = join(l:words, '_')
  execute "normal viws" . l:after_str
endfunction
command! -nargs=? ToSnakeCase call s:to_snake_case(<f-args>)
" ++ }}}

"++ ファイルやディレクトリのヤンク {{{

function! s:yank_file_name()
  let l:name = substitute(expand("%:t"), "\.[a-zA-Z]*$", "", "")
  call setreg('*', l:name)
  echo l:name
endfunction
command! YankFileName call s:yank_file_name()

function! s:yank_file_path()
  call setreg('*', expand("%:p"))
  echo expand("%:p")
endfunction
command! YankFilePath call s:yank_file_path()

function! s:yank_file_path_under_root()
  let l:path = FilePathUnderRoot()
  call setreg('*', l:path)
  echo l:path
endfunction
command! YankFilePathUnderRoot call s:yank_file_path_under_root()

function! s:yank_git_root()
  let l:path = GitProjectRootWithCache()
  call setreg('*', l:path)
  echo l:path
endfunction
command! YankGitRoot call s:yank_git_root()

function! s:yank_file_dir()
  call setreg('*', expand("%:p:h"))
  echo expand("%:p:h")
endfunction
command! YankFileDir call s:yank_file_dir()

"++ }}}

"++ カレントファイルの再読込（vim） {{{
try
  function! s:source_current_file()
    if &filetype == "vim"
      exe "source %"
    endif
  endfunction
  command! SourceCurrentFile call s:source_current_file()
catch
endtry
"++ }}}

"++ 隠しバッファの削除 {{{
function! s:delete_hidden_buffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
command! DeleteHiddenBuffers call s:delete_hidden_buffers()
"++ }}}

"++ カーソル下のhighlight情報を表示する {{{
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
"++ }}}

"++ floatwindowの移動 {{{
function! s:move_float_window(col, row)
  let l:config = nvim_win_get_config(0)
  let l:config['col'] = l:config['col'] + a:col
  let l:config['row'] = l:config['row'] + a:row
  call nvim_win_set_config(0, l:config)
  redraw
endfunction
command! MoveFloatWindowRight call s:move_float_window(8, 0)
command! MoveFloatWindowLeft call s:move_float_window(-8, 0)
command! MoveFloatWindowTop call s:move_float_window(0, -3)
command! MoveFloatWindowBottom call s:move_float_window(0, 3)
"++ }}}

"++ profile {{{
function! s:profile_start() abort
  profile start ~/profile.txt
  profile func *
  profile file *
endfunction

function! s:profile_end() abort
  profile pause
  echo "profiled => ~/profile.txt"
endfunction

command! ProfileStart call s:profile_start()
command! ProfileEnd call s:profile_end()
"++ }}}

"++ packer {{{
function! s:recompile_packer() abort
  exe "luafile ".$XDG_CONFIG_HOME."/lua/plugins.lua"
  PackerSync
endfunction
command! PackerRecompile call s:recompile_packer()
"++ }}}

"++ gitlabのfileリンク生成 {{{
function! s:yank_gitlab_file_url(with_line)
  let l:git_project_path = split(system("git -C ". GitProjectRootWithCache() . " remote -v|awk '{print $2}'"), "\n")[0][0:-5]
  let l:git_hash_value = system("git show --format='%h' --no-patch")[0:-2]
  let l:path = l:git_project_path . "/-/tree/" . l:git_hash_value . "/". FilePathUnderRoot()
  let l:path = (a:with_line == 0 ? l:path : l:path . "#L" . line("."))
  call setreg('*', l:path)
  echo l:path
endfunction
command! YankGitlabFileUrl call s:yank_gitlab_file_url(0)
command! YankGitlabFileUrlWithLine call s:yank_gitlab_file_url(1)

function! s:open_url(url)
  " TODO lemonadeの存在チェック
  let l:command = "lemonade open " . a:url
  echo l:command
  call system(l:command)
endfunction

function! s:open_gitlab_file_url(with_line)
  let l:git_project_path = split(system("git -C ". GitProjectRootWithCache() . " remote -v|awk '{print $2}'"), "\n")[0][0:-5]
  let l:git_hash_value = system("git show --format='%h' --no-patch")[0:-2]
  let l:path = l:git_project_path . "/-/tree/" . l:git_hash_value . "/". FilePathUnderRoot()
  let l:path = (a:with_line == 0 ? l:path : l:path . "#L" . line("."))
  call s:open_url(l:path)
endfunction
command! OpenGitlabFileUrl call s:open_gitlab_file_url(0)
command! OpenGitlabFileUrlWithLine call s:open_gitlab_file_url(1)

function! s:open_cursor_url()
  let l:path = GetVisualSelection()
  echom l:path
  call s:open_url(l:path)
endfunction

command! -range OpenCursorUrl <line1>,<line2>call s:open_cursor_url()
"++ }}}
