let g:expand_region_text_objects = {
      \ 'i,w'  :0,
      \ 'a,w'  :0,
      \ 'iw'  :0,
      \ 'i['  :0,
      \ 'i"'  :0,
      \ 'i'''  :0,
      \ 'i('  :0,
      \ 'i<'  :0,
      \ 'i{'  :0,
      \ 'a['  :0,
      \ 'a"'  :0,
      \ 'a'''  :0,
      \ 'a('  :0,
      \ 'a<'  :0,
      \ 'a{'  :0,
      \ 'iW'  :0,
      \ 'if'  :0,
      \ 'il'  :0,
      \ }
vmap <silent> v <Plug>(expand_region_expand)
vmap <silent> c <Plug>(expand_region_shrink)
nmap <silent> c <Plug>(expand_region_shrink)
