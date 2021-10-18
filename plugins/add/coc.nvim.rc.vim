nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nmap <silent> gr <Plug>(coc-references)

" snippetsのplaceholderの移動
let g:coc_snippet_next = '<c-s>'

" 変更点へ移動
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" git変更内容を確認
nmap gs <Plug>(coc-git-chunkinfo)
nmap gb :CocCommand git.chunkUndo<CR>

nmap [other]n :CocCommand snippets.editSnippets<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
