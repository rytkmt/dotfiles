nnoremap [search]r :<C-u>Rgrep<CR>
nnoremap [search]e :<C-u>Regrep<CR>
if has("win32")
  " Windows環境用のコード
  let Grep_Path = 'C:\git_bin\grep.exe'
  let Fgrep_Path = 'C:\git_bin\grep.exe -F'
  let Egrep_Path = 'C:\git_bin\grep.exe -E'
  let Grep_Find_Path = 'C:\git_bin\find.exe'
  let Grep_Xargs_Path = 'C:\git_bin\xargs.exe'
  let Grep_Shell_Quote_Char = '"'
endif
let Grep_Skip_Dirs = '.svn .git'
let Grep_Default_Options = '-I -G'
let Grep_Skip_Files = '*.bak *~ *.log  tags HEAD'
