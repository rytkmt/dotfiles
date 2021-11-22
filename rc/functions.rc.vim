function! FindGitProjectRoot()
  let pathMaker='%:p'
  while(len(expand(pathMaker))>1)
    let pathMaker=pathMaker.':h'
    if isdirectory(expand(pathMaker).'/.git') || filereadable(expand(pathMaker).'/README.md') || filereadable(expand(pathMaker).'/README.rdoc')
      return expand(pathMaker)
    endif
  endwhile

  " 無かったら現在のバッファで返す
  echom "not found git root"
  return expand("%:h")
endfunction

function! FilePathUnderRoot()
  return substitute(expand("%:p"), FindGitProjectRoot()."/", "", "")
endfunction

function! FilePathUnderRootWithCache()
  if exists("b:file_path_under_root")
  else
    let b:file_path_under_root = FilePathUnderRoot()
  endif

  return b:file_path_under_root
endfunction

function! FileDirUnderRoot()
  return substitute(expand("%:p:h"), FindGitProjectRoot()."/", "", "")
endfunction

function! FileDirUnderRootWithCache()
  if exists("b:file_dir_under_root")
  else
    let b:file_dir_under_root = FileDirUnderRoot()
  endif

  return b:file_dir_under_root
endfunction

function! InputPath()
  let l:default = FindGitProjectRoot()
  return input("Target path: ", l:default, "file")
endfunction
