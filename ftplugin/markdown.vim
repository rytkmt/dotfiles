" function! s:markdown_checkbox(from, to) abort
"   let from = a:from
"   let to = a:to
"
"   let another = line('v')
"   if from == to && from != another
"     if another < from
"       let from = another
"     else
"       let to = another
"     endif
"   endif
"
"   let curpos = getcursorcharpos()
"
"   let lnum = from
"   while lnum <= to
"     let line = getline(lnum)
"
"     let list_pattern = '\v^\s*([*+-]|\d+\.)\s+'
"     if line !~ list_pattern
"       " not list -> add list marker and blank box
"       let line = substitute(line, '\v\S|$', '- [ ] \0', '')
"       if lnum == curpos[1]
"         let curpos[2] += 6
"       endif
"     elseif line =~ list_pattern .. '\[ \]\s+'
"       " blank box -> check
"       let line = substitute(line, '\[ \]', '[x]', '')
"     elseif line =~ list_pattern .. '\[x\]\s+'
"       " checked box -> uncheck
"       let line = substitute(line, '\[x\]', '[ ]', '')
"     else
"       " list but no box -> add box after list marker
"       let line = substitute(line, '\v\S+', '\0 [ ]', '')
"       if lnum == curpos[1]
"         let curpos[2] += 4
"       endif
"     endif
"
"     call setline(lnum, line)
"     let lnum += 1
"   endwhile
"   call setcursorcharpos(curpos[1], curpos[2])
" endfunction
" command! -range MarkdownCheckbox call s:markdown_checkbox(<line1>, <line2>)

" nnoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>
" inoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>
" xnoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>

nmap <buffer><nowait> zch vahzf

nnoremap <buffer> g1 <CMD>s/\v^\s*(- )?/- /<CR>:noh<CR>
nnoremap <buffer> g2 <CMD>s/\v^\s*(- )?/    - /<CR>:noh<CR>
nnoremap <buffer> g3 <CMD>s/\v^\s*(- )?/        - /<CR>:noh<CR>
nnoremap <buffer> g4 <CMD>s/\v^\s*(- )?/            - /<CR>:noh<CR>
nnoremap <buffer> g5 <CMD>s/\v^\s*(- )?/                - /<CR>:noh<CR>
nnoremap <buffer> g6 <CMD>s/\v^\s*(- )?/                    - /<CR>:noh<CR>
xnoremap <buffer> g1 :<C-u>'<,'>s/\v^\s*(- )?/- /<CR>:noh<CR>
xnoremap <buffer> g2 :<C-u>'<,'>s/\v^\s*(- )?/    - /<CR>:noh<CR>
xnoremap <buffer> g3 :<C-u>'<,'>s/\v^\s*(- )?/        - /<CR>:noh<CR>
xnoremap <buffer> g4 :<C-u>'<,'>s/\v^\s*(- )?/            - /<CR>:noh<CR>
xnoremap <buffer> g5 :<C-u>'<,'>s/\v^\s*(- )?/                - /<CR>:noh<CR>
xnoremap <buffer> g6 :<C-u>'<,'>s/\v^\s*(- )?/                    - /<CR>:noh<CR>

setlocal cursorline
" インデントを4スペースに設定
setlocal tabstop=4
setlocal shiftwidth=4
setlocal comments=nb:> comments+=b:*\ [\ ],b:*\ [x],b:* comments+=b:+\ [\ ],b:+\ [x],b:+ comments+=b:-\ [\ ],b:-\ [x],b:- comments+=b:1.\ [\ ],b:1.\ [x],b:1. formatoptions-=c formatoptions+=jro
setlocal nofoldenable

function! s:auto_save()
   if !&modified || &ft != 'markdown'
     return
   endif

  " !readable == 新規ファイル
  " writable == 既にあるファイルで権限的に書き込み可能
  if !filereadable(expand('%')) || filewritable(expand('%'))
    write!
  endif
endfunction
autocmd MyAutoCmd InsertLeave * call <SID>auto_save()
