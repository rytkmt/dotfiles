function! FindGitProjectRoot()
  let pathMaker='%:p'
  while(len(expand(pathMaker))>1)
    let pathMaker=pathMaker.':h'
    let fileToCheck=expand(pathMaker).'/.git'
    if isdirectory(fileToCheck)||isdirectory(fileToCheck)
      return expand(pathMaker)
    endif
  endwhile

  " 無かったら現在のバッファで返す
  echom "not found git root"
  return "%:h"
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
