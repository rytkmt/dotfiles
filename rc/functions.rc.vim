function! RemoveShellEscapeChars(text)
  return substitute(a:text, '\v\e\[[0-9;]*[A-Za-z]', '', 'g')
endfunction

function! SystemCommandWithoutEscapeChars(command)
  return RemoveShellEscapeChars(system(a:command))
endfunction

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

function! GitProjectRootWithCache()
  if exists("b:git_project_root")
  else
    let b:git_project_root = FindGitProjectRoot()
  endif

  return b:git_project_root
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

function! GetVisualSelection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    if lnum1 == 0 && lnum2 == 0 && col1 == 0 && col2 == 0
        return ''
    endif
    let lines[-1] = lines[-1][:col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

" function! YankOnlyClipboard()
"   -- 現在の `"` レジスタの値を一時退避
"   local original_quote_register = vim.fn.getreg('"')
"   local original_quote_register_type = vim.fn.getregtype('"')
"
"   -- ビジュアルモードの開始行と終了行を取得
"   local start_line = vim.fn.getpos("'<")[2]
"   local end_line = vim.fn.getpos("'>")[2]
"
"   -- ビジュアルモードの開始列と終了列を取得
"   local start_col = vim.fn.getpos("'<")[4]
"   local end_col = vim.fn.getpos("'>")[4]
"
"
"   vim.fn.setreg('*', visual_selection, visual_selection_type)
"
"   -- `"` レジスタの値を元に戻す
"   vim.fn.setreg('"', original_quote_register, original_quote_register_type)
" endfunction
