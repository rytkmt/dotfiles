function! s:CtagsSet()
  let l:current_project_root = s:GetRailsProjectRoot()
  call s:SetProject(l:current_project_root)

  call s:SetTagsOption()
endfunction
command! CtagsSet call s:CtagsSet()

" b:project_tagとg:gem_tagsをtagsオプションにセット
function! s:SetTagsOption() "{{{
  let l:set_tags = []

  if exists('b:project_tag')
    call add(l:set_tags, b:project_tag)
  endif

  if exists('g:gem_tags') && len(g:gem_tags) > 0
    for gem_tag in g:gem_tags
      call add(l:set_tags, gem_tag)
    endfor
  endif

  if len(l:set_tags) > 0
    " setlocalのtagsオプションにセット
    let &l:tags=join(l:set_tags, ',')
  endif
endfunction "}}}

" 対象外の場合は空文字を返却
function! s:GetRailsProjectRoot() "{{{
  " プロジェクト確認のためのプラグインの存在チェック
  if(!dein#is_sourced('vim-rooter'))
    return ""
  endif

  " railsプロジェクトのファイルのみ対象
  if index(['ruby', 'javascript', 'css', 'html', 'rhtml', 'railslog', 'eruby'], &filetype) < 0
    return ""
  endif

  let l:open_project = FindRootDirectory()

  if empty(l:open_project)
    return ""
  endif

  "Rakefileの存在でrailsプロジェクトか判断
  if !filereadable(l:open_project .'/Rakefile')
    return ""
  endif

  return l:open_project
endfunction "}}}

" systemコマンドでgemのディレクトリを取得しs:SetGemTagsを叩く
function! s:CallGemEnvironment() "{{{
  if(!dein#is_sourced('vimproc.vim'))
    echom "vimprocが読み込まれていません"
    return
  endif

  call SystemAsync('gem environment gempath', 'SetGemTags')
endfunction "}}}

" g:gem_tagsにtagsのpathを格納する(手動)
function! SetGemTags(gem_env) "{{{
  let l:gem_paths = []
  if has('win32')
    let l:gem_paths = split(a:gem_env, ';')
  else
    let l:gem_paths = split(split(a:gem_env, '\n')[0], ':')
  endif

  let g:gem_tags = []
  for gem_path in l:gem_paths
    let l:gem_root = substitute(gem_path, '\n', '', 'g') . '/gems'

    if isdirectory(l:gem_root)
      if filereadable(l:gem_root . '/tags')
        call add(g:gem_tags, l:gem_root . '/tags')
      else
        echom "execute ctags. " .l:gem_root
      endif
    endif
  endfor
endfunction "}}}
command! CtagsSetGemTags call s:CallGemEnvironment()

" tagsファイルを削除し、新たにctagsを実行する
function! s:GenerateProjectTag() "{{{
  if exists("b:project_root")
    let l:async_commands = []
    " tagファイルを削除
    if filereadable(b:project_root . '/tags')
      if has('win32')
        call add(l:async_commands, "DEL " . b:project_root . '/tags')
      else
        call add(l:async_commands, "rm " . b:project_root . '/tags')
      endif
    endif

    " tagファイルを作成
    if has('win32')
      call add(l:async_commands, "CD " . b:project_root)
      let l:async_command_connection_part = '&&'
    else
      call add(l:async_commands, "cd " . b:project_root)
      let l:async_command_connection_part = '|'
    endif

    call add(l:async_commands, "ctags -R")
    call SystemAsync(join(l:async_commands, l:async_command_connection_part), 'GeneratProjectTagResult')
  else
    echom 'not rails project.'
  endif
endfunction "}}}
command! CtagsGenerateProjectTag call s:GenerateProjectTag()

" b:project_tagにセットするのみ
function! GeneratProjectTagResult(x) "{{{
  if filereadable(b:project_root . '/tags')
    let b:project_tag = b:project_root . '/tags'
  endif
endfunction "}}}

" b:project_rootとb:project_tagを設定する
function! s:SetProject(current_project_root) "{{{
  "プロジェクトが取得できなかった際は初期化
  if empty(a:current_project_root)
    if exists('b:project_root')
      unlet b:project_root
    endif
    if exists('b:project_tag')
      unlet b:project_tag
    endif
  endif

  "前と同じプロジェクトの際は何もしない
  if exists('b:project_root') && b:project_root == a:current_project_root
    return
  endif

  let b:project_root = a:current_project_root
  exe ':cd ' . b:project_root

  " 前のproject_tagが残らないようにリセット
  if exists('b:project_tag')
    unlet b:project_tag
  endif

  if filereadable(b:project_root . '/tags')
    let b:project_tag = b:project_root . '/tags'
  endif
endfunction "}}}
