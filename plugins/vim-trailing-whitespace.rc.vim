let g:extra_whitespace_ignored_filetypes = ['unite', 'denite', 'mkd', 'defx']
autocmd MyAutoCmd VimEnter,ColorScheme,BufWinEnter * :hi ExtraWhiteSpace guibg=#990000
