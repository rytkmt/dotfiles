nnoremap <buffer> FF :%s/\n//g \| %s/{/{\r/g \| %s/}/\r}/g \| %s/,/,\r/g \| filetype indent on \| normal gg=G<CR>:noh<CR>
