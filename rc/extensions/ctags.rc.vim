function! s:CheckProject()
  echom "s:CheckProject start"
  if(!dein#tap('airblade/vim-rooter') || !dein#tap('Shougo/vimproc.vim'))
    return
  endif

  if index(['ruby', 'javascript', 'css', 'html', 'rhtml', 'railslog', 'eruby'], &filetype) < 0
    return
  endif

  let l:open_project = FindRootDirectory()

  "Rakefileの存在でrailsプロジェクトか判断
  if !empty(l:open_project) && filereadable(l:open_project .'/Rakefile')
    if !exists('g:gem_paths')
      call s:SetGemPaths()
    endif

    if !exists('g:gem_paths') && len(g:gem_paths) > 0 && !exists('g:gem_tags')
      call s:SetGemTags()
    endif

    if !exists('w:current_project') || w:current_project != l:open_project
      let w:current_project = l:open_project
      exe ':cd ' . w:current_project
      call s:ChangeProject()
    endif
  else
    if exists('w:project_tag')
      unlet w:project_tag
    endif
  endif
  echom "s:CheckProject end"
endfunction
command! CtagsCheckProject call s:CheckProject()

function! s:SetGemPaths()
  echom "s:SetGemPaths start"
  let l:gem_paths = []
  if has('win32')
    let l:gem_paths = split(system('gem environment gempath'), ';')
  else
    " 配列で返るため明示的に0指定(要素は1つのため問題なし)
    let l:gem_paths = split(split(system('! gem environment gempath'), '\r')[0], ':')
  endif

  let g:gem_paths = []
  for gem_path in l:gem_paths
    let l:gem_root = substitute(gem_path, '\n', '', 'g') . '/gems'
    if isdirectory(l:gem_root)
      call add(g:gem_paths, l:gem_root)
    endif
  endfor
  echom "s:SetGemPaths end"
endfunction

function! s:SetGemTags()
  echom "s:SetGemTags start"
  let g:gem_tags = []
  for gem_path in g:gem_paths
    if filereadable(gem_path . '/tags')
      call add(g:gem_tags, gem_path . '/tags')
    endif
  endfor
  echom "s:SetGemTags end"
endfunction

function! s:ChangeProject()
  echom "s:ChangeProject start"
  if !exists('w:current_project')
    return
  endif
  if exists('w:project_tag')
    unlet w:project_tag
  endif

  if filereadable(w:current_project . '/tags')
    let w:project_tag = w:current_project . '/tags'
  endif

  let l:set_tags = []
  if exists('w:project_tag')
    call add(l:set_tags, w:project_tag)
  endif

  if exists('g:gem_tags') && len(g:gem_tags) > 0
    for gem_tag in g:gem_tags
      call add(l:set_tags, gem_tag)
    endfor
  endif

  if len(l:set_tags) > 0
    " tagsオプションにセット
    let &l:tags=join(l:set_tags, ',')
  endif
  echom "s:ChangeProject end"
endfunction

function! s:GenerateProjectTag()
  echom "s:GenerateProjectTag start"
  let l:project = FindRootDirectory()
  if filereadable(l:project .'/Rakefile')
    " tagファイルを削除
    try
      if filereadable(l:project . '/tags')
        if has('win32')
          call system("DEL " . l:project . '/tags')
        else
          call system("rm " . l:project . '/tags')
        endif
      endif
    catch
      echom 'can not delete tags'
      return
    endtry

    " tagファイルを作成
    if has('win32')
      echom 'up'
      call s:system_async("CD " . l:project . " && ctags -R", 's:GeneratedProjectTag')
    else
      call s:system_async("cd " . l:project . " | ctags -R", 's:GeneratedProjectTag')
    endif
  else
    echom 'nnot found rails project'
  endif
  echom "s:GenerateProjectTag end"
endfunction

function! s:GeneratedProjectTag()
  echom 'tag generate!!!'
endfunction
