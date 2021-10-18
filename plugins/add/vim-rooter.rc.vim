let g:rooter_manual_only = 1 "FindRootDirectory()
let g:rooter_patterns = ['Rakefile', 'Gemfile', '.svn/', '.git/']

" + ctags系 {{{

  source $XDG_CONFIG_HOME/rc/extensions/_ctags.rc.vim
  autocmd MyAutoCmd BufEnter,WinEnter * CtagsSet

  " nnoremap [ctag]u :<C-u>call UpdateTags()<CR>
  nnoremap [ctag]j <C-]>
  nnoremap [ctag]k <C-t>
  nnoremap [ctag]l :<C-u>tselect<CR>
  nnoremap [ctag]; :<C-u>tags<CR>
  nnoremap [ctag]v :vsp<CR>:exe("tjump " . expand("<cword>"))<CR>
  nnoremap [ctag]s :exe("stj " . expand("<cword>"))<CR>
  vnoremap [ctag]j g<C-]>
" + }}}
